// aqui las librearias importadas que vamos a utilizar en flutter
import 'package:flutter/material.dart';

//aqui un widget en el cual ire creando diferentes botones y los retornare
class ButtonExample extends StatelessWidget {
  // aqui definimos el constructor de la clase buttonexample
  // con la palabra reservada const y ademas recibimos un parametro
  const ButtonExample({super.key});

  //aqui en este metodo build construimos el widget y lo retornamos
  @override
  Widget build(BuildContext context) {
    // aaqui declaramos una Columna y le pasasmos un array de widgets
    // en este caso todos los botones que possee fluttter en uso y como nota adicional es que no
    // necessita un const ya que si hay una funcion () {}, no puede ser
    // una constante
    return Column(
      children: [
        Spacer(),
        ElevatedButton(
          onPressed: () {},
          onLongPress: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.amber),
          ),
          child: Text('ElevatedButton'),
        ),
        Spacer(),
        OutlinedButton(onPressed: () {}, child: Text('OutlinedButton')),
        FloatingActionButton(onPressed: null, child: Icon(Icons.add)),
        Spacer(),
        TextButton(onPressed: () {}, child: Icon(Icons.add)),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
      ],
    );
  }
}
