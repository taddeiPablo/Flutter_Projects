import 'package:flutter/material.dart';

// aqui creo el widget que utilizare para crear la parte de la descripcion
// en la card
class DescriptionCard extends StatelessWidget {
  // aca declaro una variable de tipo sttring para la descripcion
  final String? descript;
  // y siguiendo todo lo anterior requiero por constructor que sea pasada la descripcion
  const DescriptionCard({super.key, required this.descript});
  // aqui en el build construimos esta parte de la card
  @override
  Widget build(BuildContext context) {
    // aqui creo otro tipo interesante de widget en este caso un Padding
    // que solo lo utilizaremos para agregarle un padding entre widgets
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      // aqui el padding al igual que los containers pueden recibir solo un
      // hijo (child) en este caso le pasamos un Text
      child: Text(
        descript!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
