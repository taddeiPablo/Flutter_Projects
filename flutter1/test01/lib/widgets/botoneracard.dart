import 'package:flutter/material.dart';

class BotoneraCard extends StatelessWidget {
  const BotoneraCard({super.key});

  @override
  Widget build(BuildContext context) {
    // aqui creo una variable, apartir de un componenete de estilos para los tres botones
    // como los botones van a ser iguales en estilos podemos crear una variable para dicho
    // fin
    const textStyle = TextStyle(
        color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
            onPressed: () {}, child: const Text("Me gusta", style: textStyle)),
        TextButton(
            onPressed: () {}, child: const Text("Comentar", style: textStyle)),
        TextButton(
            onPressed: () {}, child: const Text("Compartir", style: textStyle))
      ],
    );
  }
}
