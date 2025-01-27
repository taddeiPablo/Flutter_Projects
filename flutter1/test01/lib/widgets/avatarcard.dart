import 'package:flutter/material.dart';

// aqui cree otro widget que utilizare para armar el avatar
// contendra las siglas el nombre.
class AvatarCard extends StatelessWidget {
  // aqui declaro una variable de tipo string que sera las siglas para el avatar
  final String avatar;
  // aqui declaro una variable de tipo string que sera el nombre del user
  final String nombre;
  // aqui en el constructor pido de manera obligatoria pasarle el avatar y el nombre del user
  const AvatarCard({super.key, required this.avatar, required this.nombre});
  // aqui build arma la estructura del avatar y el nombre, para eso utilizo una
  // FILA. Las ROW - asi como las column tambien pueden recibir hijos (children)
  // estos pueden ser del tipo que sea.
  @override
  Widget build(BuildContext context) {
    // aqui creo la Row para formar la estructura de arriba de la targeta.
    return Row(
      // aqui le pasamos los hijos (children) en este caso le paso un CircleAvatar,
      // SizedBox, Text.
      // CircleAvatar (este widget es especial ya que lo utilizo solo para pintar un circulo que contendra las siglas del nombre)
      // SizedBox (este widget tambien es un widget especial que podemos utilizar para agregar un espacio entre otros widgets)
      // Text (este es un wdiget muy utilizado en flutter nos sirve como label para mostrar texto)
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            avatar,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(nombre,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black26))
      ],
    );
  }
}
