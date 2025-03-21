// importacion de las librerias necesarias para el archivo column.dart
import 'package:flutter/material.dart';

// aqui creo un widget de tipo StatelessWidget llamado ColumnExample
// que es un widget que no tiene estado
class ColumnExample extends StatelessWidget {
  // aqui definimos el constructor de la clase ColumnExample
  // con la palabra reservada const y ademas recibimos un parametro
  // de tipo key de la clase base.
  const ColumnExample({super.key});
  // sobreescribo el metodo build que es el encargado de construir
  // el widget y lo que retorna es un widget de tipo Column
  @override
  Widget build(BuildContext context) {
    // aqui creo un widget tipo Container.
    return Container(
      color: Colors.green,
      width: 200,
      height: 300,
      // aqui creo un widget de tipo Column.
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        //aqui creo una lista de widgets de tipo text
        children: [
          Text("PRIMERO EJEMPLO 1 !!!"),
          Text("PRIMERO EJEMPLO 2 !!!"),
          Text("PRIMERO EJEMPLO 3 !!!"),
          Text("PRIMERO EJEMPLO 4 !!!"),
        ],
      ),
    );
  }
}
