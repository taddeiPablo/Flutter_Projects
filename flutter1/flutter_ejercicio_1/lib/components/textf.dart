// ignore_for_file: file_names

import 'package:flutter/material.dart';

// aqui creo esta clase para crear textfield y sus propiedades
// propiedades que vamos a utilizar constantemente
class TextFieldExample extends StatelessWidget {
  // aqui el constructor de esta clase que recibe un parametro de tipo key
  // que es de la clase base
  const TextFieldExample({super.key});

  // aqui construimos el widget y lo retornamos que es un Column
  @override
  Widget build(BuildContext context) {
    // aqui retornamos un Column que es un widget que organiza a sus hijos
    return const Column(
      children: [
        // aplicando un padding all textfield para que no quede tan pegado al
        // borde de la pantallas
        Padding(
          padding: EdgeInsets.all(8.0),
          //Textfield widget
          //maxLines
          //maxLength
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nombre',
              hintText: 'Ingrese su nombre',
              helperText: 'Nombre y Apellido',
              suffixIcon: Icon(Icons.accessibility),
              prefixIcon: Icon(Icons.account_circle),
            ),
          ),
        ),
      ],
    );
  }
}
