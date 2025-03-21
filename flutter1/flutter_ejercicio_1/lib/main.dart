// librerias importadas que vamos a utilizar en flutter
import 'package:flutter/material.dart';
import 'package:flutter_ejercicio_1/layouts/column.dart';

// esta funcion main es el punto de ingreso al programa
// fundamental para que la app funcione
void main() {
  runApp(const MainApp());
}

// aqui podemos ver un ejemplo claro de como crear un
// widget de tipo StatelessWidget
// StatelessWidget es un widget que no tiene estado
class MainApp extends StatelessWidget {
  // aqui definimos el constructor de la clase mainapp
  // con la palabra reservada const y ademas recibimos un parametro
  // de tipo key de la clase base.
  const MainApp({super.key});

  // aqui sobreescribimos el metodo build que es el encargado
  // de construir el widget y lo que retorna es un MaterialApp
  // que es un widget que implementa el material design de google
  @override
  Widget build(BuildContext context) {
    // aqui creo una instancia de MaterialApp y le paso un Scaffold
    // que es un widget que implementa el diseño de una pantalla
    // y le paso un body que es un widget de tipo ColumnExample
    return const MaterialApp(home: Scaffold(body: ColumnExample()));
  }
}
