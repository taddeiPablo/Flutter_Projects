// aqui importo la libreria de flutter necesaria para crear lo necesasrio
import 'package:flutter/material.dart';

// aqui creo una clase AppTextStyles que contiene los estilos de texto que se van a utilizar en la aplicacion
// la clase es estatica para que no se pueda instanciar y los estilos son estaticos para que se puedan utilizar sin crear una instancia de la clase
// la clase contiene los estilos de texto que se van a utilizar en la aplicacion
class AppTextStyles {
  //
  static const TextStyle genderTitleSeleted = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleResult = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle resultIMC = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 70,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle description = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}
