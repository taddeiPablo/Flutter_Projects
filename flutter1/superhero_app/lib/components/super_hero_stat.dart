// importando las librerias necesarias
import 'package:flutter/material.dart';

// creando la clase SuperHeroStat que extiende StatelessWidget
// esta clase representa un widget que muestra una barra de estadisticas de un superheroe
class SuperHeroStat extends StatelessWidget {
  final String statName;
  final String statStr;

  // constructor de la clase SuperHeroStat
  // recibe dos parametros: statStr y statName
  const SuperHeroStat({
    super.key,
    required this.statStr,
    required this.statName,
  });

  // el metodo build que construye el widget
  // este metodo es llamado cada vez que el widget necesita ser reconstruido
  @override
  Widget build(BuildContext context) {
    double stat = getParseStat(statStr); //double.parse(statStr);
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

  // metodo que devuelve el color de la barra de estadisticas
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

  // metodo que convierte el string de la estadistica a un double
  // si el string es "null", devuelve 0.0
  double getParseStat(String statStr) {
    return statStr == "null" ? 0.0 : double.parse(statStr);
  }
}
