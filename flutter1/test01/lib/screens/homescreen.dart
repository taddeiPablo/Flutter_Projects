/// aqui importamos la libreria necesaria para construir la GUI
import 'package:flutter/material.dart';

///HomeScreen - aqui separamos la construccion de la GUI
///la cual llamamos widget a un archivo por separado.

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
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 350,
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(10),
        child: Container(
          child: const Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text(
                      "P",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Pablo Taddei",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black26))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
