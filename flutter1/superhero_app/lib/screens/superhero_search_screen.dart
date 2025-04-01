import 'package:flutter/material.dart';

class SuperHeroSearchScreen extends StatefulWidget {
  const SuperHeroSearchScreen({super.key});

  @override
  State<SuperHeroSearchScreen> createState() => _SuperHeroSearchScreenState();
}

class _SuperHeroSearchScreenState extends State<SuperHeroSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SuperHero App")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "busca un superheroe",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {},
            ),
          ),
        ],
      ),
    );
  }
}
