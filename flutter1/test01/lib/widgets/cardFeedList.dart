import 'package:flutter/material.dart';
import 'package:test01/widgets/cardFeed.dart';
import '../data/data.dart';

// aqui creo un nuevo wdiget en el cual vamos a generar una lista para nuestras
// cards y a su vez vamos a utilizar una lista de maps para simular datos traidos de
// alguna fuentet de datos.
class CardfeedList extends StatelessWidget {
  // aqui tengo el constructor de este widget pero esta vez no requiero ningun parametro
  // que tengamos que pasarle.
  const CardfeedList({
    super.key,
  });

  //en el build contruimos la lista con las cards
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

    // esta es la forma de crear un Listview o una lista para mostrar los datos.
    // a su vez llamamos a nuestro widget CardFeed el cual requiere una card
    //y le pasamos el elemento atravez del index
    return ListView.builder(
        // aca en itemCount le indicamos la cantidad de items que tenemos.
        itemCount: listCard.length,
        // aca recorremos los items de la lista
        itemBuilder: (context, index) {
          //RECORDAR: en esta ocacion no colocar "const" ya que tendra datos
          // dinamicos.
          return CardFeed(card: listCard.elementAt(index));
        });
  }
}
