import 'package:flutter/material.dart';

// aca creo un widget con el manejo de estado
// esto se llama StatefulWidget
class LikeButton extends StatefulWidget {
  // aca el constructor sin parametros para este caso
  const LikeButton({super.key});

  // aqui creamos utilizando un State esto es un objeto interno
  // utilizado por flutter para poder manejar un estado interno
  // en el wdiget en el declararemos todo aquello que utilizaremos.
  @override
  State<LikeButton> createState() => _LikeButtonState();
}

// aqui creo una clase que extiende (Hereda) del State que acabo
// de crear de esta manera le estoy dando la posibilidad de manejar
// estados a este widget
class _LikeButtonState extends State<LikeButton> {
  // declaro una variable de tipo boolean
  bool _stateLike = false;

  // aqui en el build comienzo a armar la estructura
  // del boton me gusta
  @override
  Widget build(BuildContext context) {
    // aqui utilizando el Textbutton que es un widget de uso general en flutter
    // construyo la estructura y ademas utilizo el evento onPressed
    return TextButton(
        // aqui en el evento onPressed que se ejecuta al momento de presionar
        // el boton en este momento es donde vamos a trabajar con el estado de la variable
        // _stateLike
        onPressed: () {
          // aqui en el setState es donde manejamos los estados de esta variable.
          setState(() {
            _stateLike = !_stateLike;
          });
        },
        // y finalmente el TextButton tambien puede recibir un hijo(child)
        // el cual en este caso es un Text para darle un nombre a este boton que en este caso es "ME GUSTA"
        child: Text("Me gusta",
            style: TextStyle(
                // aqui en el color lo que hacemos es dependiendo del estado de la variable _stateLike cambiamos el color del texto del boton
                color: _stateLike ? Colors.blueAccent : Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold)));
  }
}
