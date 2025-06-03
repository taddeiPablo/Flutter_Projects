// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash_screen_example/screen/detection_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio - Recetas'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '¡Bienvenido a tu recetario!',
              style: GoogleFonts.pacifico(
                fontSize: 28,
                color: Colors.brown[800],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetectionScreen()),
                );
              },
              child: Text('Detectar Ingredientes'),
            ),
          ],
        ),
      ),
    );
  }
}
