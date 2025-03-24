// ignore_for_file: file_names

import 'package:flutter/material.dart';

//
class TextFieldExample extends StatelessWidget {
  //
  const TextFieldExample({super.key});

  //
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nombre',
            hintText: 'Ingrese su nombre',
            helperText: 'Nombre y Apellido',
            suffixIcon: Icon(Icons.accessibility),
            prefixIcon: Icon(Icons.account_circle),
          ),
        ),
      ],
    );
  }
}
