import 'package:flutter/material.dart';
import 'package:splash_screen_example/screen/splashScreen.dart';

void main() {
  runApp(const RecetasApp());
}

class RecetasApp extends StatelessWidget {
  const RecetasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recetas App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
