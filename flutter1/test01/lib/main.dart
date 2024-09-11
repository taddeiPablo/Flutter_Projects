import 'package:flutter/material.dart';
import 'package:test01/screens/HomeScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter 1',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
