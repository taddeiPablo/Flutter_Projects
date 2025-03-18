/// aqui importamos la libreria necesaria para construir la GUI
library;

import 'package:flutter/material.dart';
import 'package:test01/widgets/cardFeedList.dart';

///HomeScreen - aqui separamos la construccion de la GUI
///la cual llamamos widget a un archivo por separado.

// construir la clase HomeScreen que extiende de StatelessWidget
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  // aqui es donde se construye el widget es donde vamos a construir la estructura
  // de las views y demas
  @override
  Widget build(BuildContext context) {
    // aqui construimos un Scaffold y lo devolvemos para luego poder ser renderizado
    return Scaffold(
        // aqui le aplicamos un color de fondo al Scaffold
        backgroundColor: Colors.blueGrey,
        // aqui aplicamos un color de fondo al appBar, es la navegacion superior
        // tambien le aplicamos un titulo
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Flutter 1'),
        ),
        // aqui tenemos un body que forma parte del Scaffold
        // en este caso al body le incorporamos un Widget que contiene
        // un listview.builder
        body: const CardfeedList() //const CardFeed(),
        );
  }
}
