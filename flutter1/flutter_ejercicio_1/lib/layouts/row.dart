// importamos las librerias necesarias para trabajar con material
import 'package:flutter/material.dart';

// Creamos un widget de tipo StatelessWidget
// Este widget nos permitira crear un Row
class RowExample extends StatelessWidget {
  // Constructor que recibe una key
  // const RowExample({Key? key}) : super(key: key);
  const RowExample({super.key});
  // Metodo build que retorna un widget
  // En este caso un Row con 3 children
  @override
  Widget build(BuildContext context) {
    // este widget nos permite determinar un padding sobre otro widget
    return Padding(
      padding: const EdgeInsets.only(top: 86.0),
      // este widget nos permite alinear los widgets hijos en una fila
      // "SizedBox" nos permite agregar un espacio en un widget, se suele
      // utilizar este widget solo si lo unico que necesitamos es aplicar
      // tamaño a un widget, para quitar espacios en blanco
      child: SizedBox(
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("PRIMERA FILA !!!"),
            Text("SEGUNDA FILA !!!"),
            Text("TERCER FILA !!!"),
          ],
        ),
      ),
    );
  }
}
