import 'package:flutter/material.dart';

// aqui vamos a crear un ejemplo ded text y sus propiedades
// propiedades que vamos a utilizar constantemente
class TextExample extends StatelessWidget {
  const TextExample({super.key});
  // aqui construimos el widget y lo retornamos
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // aqui a este text le aplicamos la gran mayoria de las propiedades
        // que posee un text
        Text(
          " aqui primer texto creado",
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            decorationStyle: TextDecorationStyle.dotted,
            letterSpacing: 2,
            wordSpacing: 2,
            shadows: [
              Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 3),
            ],
            backgroundColor: Colors.yellow,
            height: 2,
            locale: Locale('es'),
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
