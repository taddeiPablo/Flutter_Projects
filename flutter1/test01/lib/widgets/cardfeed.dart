/// aqui importamos la libreria necesaria para construir la GUI
import 'package:flutter/material.dart';
import 'package:test01/widgets/avatarcard.dart';
import 'package:test01/widgets/botoneracard.dart';
import 'package:test01/widgets/descriptioncard.dart';

class CardFeed extends StatelessWidget {
  const CardFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 450,
      decoration: const BoxDecoration(color: Colors.white),
      //padding: const EdgeInsets.all(10),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const AvatarCard(),
            ),
            const DescriptionCard(),
            Container(
              width: double.infinity,
              height: 280,
              child: Image.network(
                  "https://images.pexels.com/photos/27501815/pexels-photo-27501815/free-photo-of-madera-paisaje-naturaleza-agua.jpeg",
                  fit: BoxFit.cover),
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
