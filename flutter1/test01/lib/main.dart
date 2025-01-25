import 'package:flutter/material.dart';
import 'package:test01/screens/HomeScreen.dart';

void main() => runApp(const MyApp());

// clase principal en la cual extiende de StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // aqui crceamos el widget principal de tipo MaterialApp
  // aqui en este metodo build se realiza estat accion
  @override
  Widget build(BuildContext context) {
    // aqui retornamos el MaterialApp con algunas configuracion como por ejemplo
    // title, debugShowCheckedModeBanner, home (AQUI LLAMO AL WIDGET DE LA PANTALLA HOMESCREEN)
    return const MaterialApp(
      title: 'Flutter 1',
      debugShowCheckedModeBanner: false,
      home:
          HomeScreen(), // aqui el widget creado anteriormente llamado screens\homescreen.dart
    );
  }
}
