/// aqui importamos la libreria necesaria para construir la GUI
import 'package:flutter/material.dart';
import 'package:test01/widgets/avatarcard.dart';
import 'package:test01/widgets/botoneracard.dart';
import 'package:test01/widgets/descriptioncard.dart';

//AQUI CREAMOS ESTE NUEVO WIDGET PARA SERPARAR LA LOGICA DE NUESTRA APP
// EN ESTE CASO A ESTE WIDGET LO LLAMAMOS CardFeed.
class CardFeed extends StatelessWidget {
  //
  final Map<String, String> card;
  //
  const CardFeed({super.key, required this.card});

  //FUNCION EN LA CUAL SE CREA ESTE WIDGET
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 450,
      decoration: const BoxDecoration(color: Colors.white),
      //padding: const EdgeInsets.all(10),
      //
      child: Container(
        //
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //
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
              child: Image.network(card["image"]!, fit: BoxFit.cover),
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
