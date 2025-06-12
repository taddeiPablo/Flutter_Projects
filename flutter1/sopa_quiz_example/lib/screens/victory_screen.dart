import 'package:flutter/material.dart';

class VictoryScreen extends StatelessWidget {
  final int score;
  const VictoryScreen({required this.score, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("¡Felicidades!")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("🏆 Has completado el juego", style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            Text("Palabras acertadas: $score", style: TextStyle(fontSize: 20)),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Volver al inicio"),
            ),
          ],
        ),
      ),
    );
  }
}
