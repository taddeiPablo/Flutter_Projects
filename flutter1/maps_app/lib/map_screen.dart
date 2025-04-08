// aqui importo la libreria ded material dart necesaria
import 'package:flutter/material.dart';
// aqui importamos la libreria necesaria para poder trabajar con los mapas de google
import 'package:google_maps_flutter/google_maps_flutter.dart';

// aqui creo un nuevo widget con maanejo de estados.
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

// aqui creo la clase que maneja el estado del widget anterior
// esta clase es la que se encarga de manejar el estado del widget MapScreen
class _MapScreenState extends State<MapScreen> {
  // aqui creo una variable que ssera de tipo GoogleMapController
  // esta variable es la que se encarga de controlar el mapa de google
  // es importante que esta variable sea nullable ya que el mapa no se crea hasta que se llama al metodo onMapCreated
  // el cual se encarga de inicializar el mapa y de asignar el controlador al mapa
  // por lo tanto esta variable sera de tipo nullables
  GoogleMapController? _controller;
  // aqui creo una variable que sera de tipo CameraPosition
  // esta variable es la que se encarga de controlar la posicion de la camara del mapa
  final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(28.490295, -16.326535),
  );

  // aqui creo una variable que sera de tipo Set<Marker>
  // esta variable es la que se encarga de controlar los marcadores del mapa
  // esta variable es de tipo Set ya que los marcadores no pueden tener el mismo id
  final Set<Marker> _markers = <Marker>{
    Marker(
      markerId: const MarkerId('marker_1'),
      position: LatLng(28.490295, -16.326535),
    ),
  };
  // aqui en esta funcion es donde voy cargaando los puntos que quiero guardara
  void addMarker(LatLng latlong) async {
    TextEditingController markerIdController = TextEditingController();

    String? title = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Añade un marcador"),
          content: TextField(
            controller: markerIdController,
            decoration: const InputDecoration(
              hintText: "Introduce el ID del marcador",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(null),
              child: Text("cancelar"),
            ),
            TextButton(
              onPressed:
                  () => Navigator.of(context).pop(markerIdController.text),
              child: Text("Guardar"),
            ),
          ],
        );
      },
    );

    if (title != null && title.isNotEmpty) {
      setState(() {
        _markers.add(Marker(markerId: MarkerId(title), position: latlong));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map Screen')),
      // aqui en el body creo un widget de tipo goolemap
      // este widget es el que se encarga de mostrar el mapa de google
      // el widget google map tiene varios parametros que se pueden configurar
      body: GoogleMap(
        // aqui configuro el punto inicial del mapa
        initialCameraPosition: _initialCameraPosition,
        // aqui en este evento configuramos el controller.
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        // aqui determinamos el tipo de mapa que queremos mostrar
        mapType: MapType.satellite,
        // aqui le determinamos los puntos a mostrar
        markers: _markers,
        // aqui en este onntap determinamos al hacer click en el mapa podemor
        // guardar el nuevo market.
        onTap: (argument) => print(argument),
      ),
    );
  }
}
