// ignore: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splash_screen_example/screen/homeScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Puedes cambiar esto por un logo o imagen temática
            Image.asset('assets/hi.png', width: 120),
            SizedBox(height: 20),
            Text(
              'Recetas Deliciosas',
              style: GoogleFonts.pacifico(
                fontSize: 28,
                color: Colors.brown[800],
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(color: Colors.brown[700]),
          ],
        ),
      ),
    );
  }
}
