// importamos las librerias necesarias
import 'package:flutter/material.dart';

// aqui creo un widget de tipo StatelessWidget
// que me permitira mostrar imagenes
// desde la red o desde la carpeta assets
class ImageExample extends StatelessWidget {
  // aqui declaro el constructor de la clase
  // con una propiedad key de tipo Key que proviene del padre
  const ImageExample({super.key});

  // aqqui sobreescribo el metodo build
  // que me permitira construir el widget
  @override
  Widget build(BuildContext context) {
    // creo una columna que me permitira
    // mostrar las imagenes
    // en la primera imagen muestro una imagen
    return Column(
      // aqui determinamos los hijos que recibe la columna
      children: [
        // images que carga desde la red
        Image.network(
          "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
        ),
        // images que carga desde la carpeta assets
        Image.asset("assets/images/flutter-ico.png"),
      ],
    );
  }
}
