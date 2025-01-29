/// aqui importamos la libreria necesaria para construir la GUI
import 'package:flutter/material.dart';
import 'package:test01/widgets/avatarcard.dart';
import 'package:test01/widgets/botoneracard.dart';
import 'package:test01/widgets/descriptioncard.dart';

//AQUI CREAMOS ESTE NUEVO WIDGET PARA SERPARAR LA LOGICA DE NUESTRA APP
// EN ESTE CASO A ESTE WIDGET LO LLAMAMOS CardFeed.
class CardFeed extends StatelessWidget {
  // aqui creo una variable tipo Map(esto seria un diccionario) para obtener cada
  // info que sse cargara en los cards, ademas al declarar una variable aqui flutter te pide
  // que pidas este dato por constructor de la siguiente manera : required this.card
  final Map<String, String> card;
  // aqui en el constructor de este widget le determino que se pase si o si un parametro
  // este es required this.card
  const CardFeed({super.key, required this.card});

  //FUNCION EN LA CUAL SE CREA ESTE WIDGET
  @override
  Widget build(BuildContext context) {
    // Container - Este widget es un de los muchos que podemos utilizar.
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 450,
      decoration: const BoxDecoration(color: Colors.white),
      //padding: const EdgeInsets.all(10),
      // Los Container puedo contener un solo child(hijo) esto podria ser otro
      // container o column o row o cualquier otro elemento
      child: Container(
        // Column - otro widget muy necesario en el desarrollo con flutter.
        // este widget puede recibir varios children(hijos)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // aqui estan los hijos que puede tener una Column en este caso
          // con mas containers, pero podrian ser cualquier otro elemento
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: AvatarCard(
                avatar: card["avatar"]!,
                nombre: card["name"]!,
              ),
            ),
            Container(
              child: DescriptionCard(
                descript: card["descripcion"],
              ),
            ),
            Container(
              width: double.infinity,
              height: 280,
              child: Image.asset(card[
                  "image"]!), //Image.network(card["image"]!, fit: BoxFit.cover),
            ),
            Container(
              child: const BotoneraCard(),
            )
          ],
        ),
      ),
    );
  }
}
