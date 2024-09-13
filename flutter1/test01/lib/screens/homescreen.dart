/// aqui importamos la libreria necesaria para construir la GUI
import 'package:flutter/material.dart';
import 'package:test01/widgets/CardFeed.dart';

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
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Flutter 1'),
        ),
        body: ListView(
          children: [
            const CardFeed(),
            const CardFeed(),
            const CardFeed(),
            const CardFeed(),
            const CardFeed(),
          ],
        ) //const CardFeed(),
        );
  }
}
