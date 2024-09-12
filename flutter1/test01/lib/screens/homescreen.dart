/// aqui importamos la libreria necesaria para construir la GUI
import 'package:flutter/material.dart';

///HomeScreen - aqui separamos la construccion de la GUI
///la cual llamamos widget a un archivo por separado.

// construir la clase HomeScreen que extiende de StatelessWidget
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  // aqui es donde se construye el widget es donde vamos a construir la estructura
  // de las views y demas
  @override
  Widget build(BuildContext context) {
    // aqui creo una variable, apartir de un componenete de estilos para los tres botones
    // como los botones van a ser iguales en estilos podemos crear una variable para dicho
    // fin
    const textStyle = TextStyle(
        color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold);
    // aqui construimos un Scaffold y lo devolvemos para luego poder ser renderizado
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Flutter 1'),
      ),
      body: Container(
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
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Text(
                        "P",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Pablo Taddei",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black26))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Text(
                  "iasjfoiajsdoifasoidfjoasifjoiasjfdoiaoiasdjfoiajfoiajsofiaosdijfaoifjdoaijdfoiajdfoijasofijasoifjoasidfjsoiajodfia",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: double.infinity,
                height: 280,
                child: Image.network(
                    "https://images.pexels.com/photos/27501815/pexels-photo-27501815/free-photo-of-madera-paisaje-naturaleza-agua.jpeg",
                    fit: BoxFit.cover),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text("Me gusta", style: textStyle)),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Comentar", style: textStyle)),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Compartir", style: textStyle))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
