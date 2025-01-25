import 'package:flutter/material.dart';
import 'package:test01/widgets/cardFeed.dart';
import '../data/data.dart';

//
class CardfeedList extends StatelessWidget {
  //
  const CardfeedList({
    super.key,
  });

  //
  @override
  Widget build(BuildContext context) {
    /*return ListView(
      children: [
        const CardFeed(),
        const CardFeed(),
        const CardFeed(),
        const CardFeed(),
        const CardFeed(),
      ],
    );*/

    //
    return ListView.builder(
        itemCount: listCard.length,
        itemBuilder: (context, index) {
          //RECORDAR: en esta ocacion no colocar "const" ya que tendra datos
          // dinamicos.
          return CardFeed(card: listCard.elementAt(index));
        });
  }
}
