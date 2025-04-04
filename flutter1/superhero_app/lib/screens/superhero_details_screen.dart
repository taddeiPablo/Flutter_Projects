//
import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_details_response.dart';

//
class SuperHeroDetailScreen extends StatelessWidget {
  //
  final SuperheroDetailsResponse superheroDetails;

  //
  const SuperHeroDetailScreen({super.key, required this.superheroDetails});

  // //Center(child: Text(superheroDetails.name.toString())),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SuperHero : ${superheroDetails.name}")),
      body: Column(
        children: [
          Image.network(
            superheroDetails.url,
            height: 550,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment(0, -0.6),
          ),
        ],
      ),
    );
  }
}
