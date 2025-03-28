// aqui importo las librerias necesarias
import 'package:flutter/material.dart';
import 'package:imc_calculator_app/components/gender_selector.dart';
import 'package:imc_calculator_app/components/height_selector.dart';
import 'package:imc_calculator_app/components/number_selector.dart';

// aqui declaro la clase ImcHomeScreen que utilizare como una screen
// o view de nuestra app
// ademas hay que notar que la misma clase hereda en esta ocacion
// de la clase statefulWidget. Esto quiero decir que esta clase
// podra manejar estados.
class ImcHomeScreen extends StatefulWidget {
  // declaro el constructor
  const ImcHomeScreen({super.key});
  // sobreescribo el metodo createState que me permitira manejar estados.
  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

// aqui declaro esta clase ImcHomeScreenState que hereda de la clase State
// y que me permitira manejar los estados de la clase ImcHomeScreen
// ademas esta clase notese que es privada.
class _ImcHomeScreenState extends State<ImcHomeScreen> {
  // aqui se implementa el metodo build que me permitira construir
  // la vista de la pantalla.
  // en este caso se retorna un Column que contiene un widget GenderSelector
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(),
        Row(
          children: [
            NumberSelector(title: "PESO", value: 90),
            //NumberSelector(title: "EDAD", value: 20),
          ],
        ),
      ],
    );
  }
}
