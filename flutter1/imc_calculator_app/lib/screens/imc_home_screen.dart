// aqui importo las librerias necesarias
import 'package:flutter/material.dart';
import 'package:imc_calculator_app/components/gender_selector.dart';
import 'package:imc_calculator_app/components/height_selector.dart';
import 'package:imc_calculator_app/components/number_selector.dart';
import 'package:imc_calculator_app/core/app_colors.dart';
import 'package:imc_calculator_app/core/app_text_styles.dart';

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
  int selectedAge = 20;
  int selectedWight = 90;
  // aqui se implementa el metodo build que me permitira construir
  // la vista de la pantalla.
  // en este caso se retorna un Column que contiene un widget GenderSelector
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "PESO",
                  value: selectedWight,
                  onDecrement: () {
                    setState(() {
                      selectedWight--;
                    });
                  },
                  onIncrement: () {
                    setState(() {
                      selectedWight++;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: NumberSelector(
                  title: "EDAD",
                  value: selectedAge,
                  onDecrement: () {
                    setState(() {
                      selectedAge--;
                    });
                  },
                  onIncrement: () {
                    setState(() {
                      selectedAge++;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.quinary),
              ),
              child: Text(
                "CALCULAR IMC",
                style: AppTextStyles.genderTitleSeleted,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
