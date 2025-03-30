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
  // aqui declaro las variables necesarias
  // para pasasrle al wigdet NumberSelector
  int selectedAge = 20;
  int selectedWight = 90;
  double selectedheight = 150;
  // aqui se implementa el metodo build que me permitira construir
  // la vista de la pantalla.
  // en este caso se retorna un Column que contiene un widget GenderSelector
  @override
  Widget build(BuildContext context) {
    // aqui defino una columna para comenzar a esstructura la vista
    return Column(
      children: [
        // aqui utilizo el widget GenderSelector que me permitira
        // seleccionar el genero del usuario.
        GenderSelector(),
        // aqui utilizo el widget HeightSelector que me permitira
        // seleccionar la altura del usuario.
        HeightSelector(
          height: selectedheight,
          onChangedHeight: (p0) {
            setState(() {
              selectedheight = p0;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // aqui utilizo el widget NumberSelector que me permitira
              // seleccionar el peso del usuario. y ademas debemos pasarle
              // las funciones onDecrement y onIncrement que me permitiran
              // decrementar o incrementar el peso del usuario.
              Expanded(
                child: NumberSelector(
                  title: "PESO",
                  value: selectedWight,
                  // aqui desminuimos el valor del peso en 1
                  onDecrement: () {
                    setState(() {
                      selectedWight--;
                    });
                  },
                  // aqui incrementamos el valor del peso en 1
                  onIncrement: () {
                    setState(() {
                      selectedWight++;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              // aqui vuelvo a utilizar el widget NumberSelector que me permitira
              // seleccionar la edad del usuario. y ademas debemos pasarle
              // las funciones onDecrement y onIncrement que me permitiran
              // decrementar o incrementar la edad del usuario.
              Expanded(
                child: NumberSelector(
                  title: "EDAD",
                  value: selectedAge,
                  // aqui desminuimos el valor de la edad en 1
                  onDecrement: () {
                    setState(() {
                      selectedAge--;
                    });
                  },
                  // aqui incrementamos el valor de la edad en 1
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
