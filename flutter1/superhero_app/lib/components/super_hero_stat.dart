//
import 'package:flutter/material.dart';

//
class SuperHeroStat extends StatelessWidget {
  final double stat;
  final String statName;

  //
  const SuperHeroStat({super.key, required this.stat, required this.statName});

  //
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(height: stat, width: 20, color: getStatColor(stat)),
        Text(
          statName,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  //
  Color getStatColor(double value) {
    if (value >= 50 && value <= 100) {
      return Colors.red;
    } else if (value >= 25 && value <= 50) {
      return Colors.deepOrange;
    } else if (value <= 25 && value >= 15) {
      return Colors.deepOrangeAccent;
    } else if (value <= 15 && value >= 5) {
      return Colors.yellowAccent;
    } else if (value <= 5 && value >= 0) {
      return Colors.yellow;
    } else if (value == 0) {
      return Colors.lightBlue;
    } else {
      return Colors.black;
    }
  }
}
