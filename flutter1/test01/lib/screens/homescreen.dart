// aqui importamos la libreria necesaria para construir la GUI
import 'package:flutter/material.dart';

/**
 * HomeScreen - aqui separamos la construccion de la GUI
 * la cual llamamos widget a un archivo por separado.
 */
// construir la clase HomeScreen que extiende de StatelessWidget
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Flutter 1'),
      ),
      body: Container(),
    );
  }
}
