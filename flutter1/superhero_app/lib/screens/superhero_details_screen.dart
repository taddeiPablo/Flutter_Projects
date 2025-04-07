//
//
import 'package:flutter/material.dart';
import 'package:superhero_app/components/super_hero_stat.dart';
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
            height: 450,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment(0, -0.6),
          ),
          Center(
            child: Text(
              superheroDetails.realName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "Estadisticas",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                //double.parse(superheroDetails.powerstats.power)
                children: [
                  SuperHeroStat(
                    statName: "Power",
                    statStr: superheroDetails.powerstats.power,
                  ),
                  SuperHeroStat(
                    statName: "Strength",
                    statStr: superheroDetails.powerstats.strength,
                  ),
                  SuperHeroStat(
                    statName: "Intelligence",
                    statStr: superheroDetails.powerstats.intelligence,
                  ),
                  SuperHeroStat(
                    statName: "Speed",
                    statStr: superheroDetails.powerstats.speed,
                  ),
                  SuperHeroStat(
                    statName: "Combat",
                    statStr: superheroDetails.powerstats.combat,
                  ),
                  SuperHeroStat(
                    statName: "Durability",
                    statStr: superheroDetails.powerstats.durability,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
