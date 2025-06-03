import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DetectionScreenState createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  CameraController? _cameraController;
  Interpreter? _interpreter;
  late ImageProcessor _imageProcessor;
  List<String> _labels = [];
  String? _prediction;
  bool _isDetecting = false;
  Timer? _timer;

  final int _inputSize = 224;

  @override
  void initState() {
    super.initState();
    _loadModel();
    _initCamera();
  }

  Future<void> _loadModel() async {
    try {
      final interpreterOptions = InterpreterOptions();
      _interpreter = await Interpreter.fromAsset(
        'model.tflite',
        options: interpreterOptions,
      );
      final labelData = await DefaultAssetBundle.of(
        context,
      ).loadString('assets/labels.txt');
      _labels = labelData.split('\n');
    } catch (e) {
      print('Error cargando el modelo: $e');
    }
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    _cameraController = CameraController(
      camera,
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await _cameraController!.initialize();

    _cameraController!.startImageStream((CameraImage image) async {
      if (!_isDetecting) {
        _isDetecting = true;
        _runModel(image);
      }
    });
    setState(() {});
  }

  Future<void> _runModel(CameraImage image) async {
    try {
      // Convertir a formato compatible
      final input = _convertCameraImage(image);
      final inputTensor = TensorImage.fromImage(input);
      _imageProcessor =
          ImageProcessorBuilder()
              .add(ResizeOp(_inputSize, _inputSize, ResizeMethod.BILINEAR))
              .build();
      final processedImage = _imageProcessor.process(inputTensor);

      final inputBuffer = processedImage.buffer;
      final outputBuffer = TensorBuffer.createFixedSize(<int>[
        1,
        _labels.length,
      ], TfLiteType.float32);

      _interpreter!.run(inputBuffer, outputBuffer.buffer);

      final results = outputBuffer.getDoubleList();
      final maxIndex = results.indexWhere((e) => e == results.reduce(math.max));

      setState(() {
        _prediction = _labels[maxIndex];
      });
    } catch (e) {
      print('Error al ejecutar el modelo: $e');
    } finally {
      _isDetecting = false;
    }
  }

  img.Image _convertCameraImage(CameraImage image) {
    final int width = image.width;
    final int height = image.height;
    final img.Image imgImage = img.Image(
      width,
      height,
    ); //(width: width, height: height);

    final plane = image.planes[0];
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        final pixelIndex = y * plane.bytesPerRow + x;
        final pixel = plane.bytes[pixelIndex];
        imgImage.setPixelRgba(
          x,
          y,
          pixel,
          pixel,
          pixel,
        ); //.setPixelRgb(x, y, pixel, pixel, pixel);
      }
    }
    return img.copyRotate(
      img.copyResize(imgImage, width: _inputSize, height: _inputSize),
      90,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cameraController?.dispose();
    _interpreter?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clasificación en Tiempo Real'),
        backgroundColor: Colors.deepOrange,
      ),
      body:
          _cameraController == null || !_cameraController!.value.isInitialized
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                children: [
                  CameraPreview(_cameraController!),
                  if (_prediction != null)
                    Positioned(
                      bottom: 32,
                      left: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Ingrediente: $_prediction',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
    );
  }
}
