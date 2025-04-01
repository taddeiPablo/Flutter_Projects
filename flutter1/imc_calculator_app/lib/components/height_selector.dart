// aqui librerias necesarias para el armado del widget
import 'package:flutter/material.dart';
import 'package:imc_calculator_app/core/app_colors.dart';
import 'package:imc_calculator_app/core/app_text_styles.dart';

// aqui creo la clase para crear un widget que utitlizare para
// seleccionar la altura del usuario
// el widget es un stateful porque el valor de la altura cambia.
class HeightSelector extends StatefulWidget {
  final double height;
  final Function(double) onChangedHeight;

  // aqui el constructor que recibe la altura y la funcion que se ejecutara.
  const HeightSelector({
    super.key,
    required this.height,
    required this.onChangedHeight,
  });

  // declaro una clase privadad que se llama _HeightSelectorState
  // que extiende de State<HeightSelector> para poder crear el estado del widget.
  // esta clase es privada porque no la voy a utilizar en ningun otro lado
  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

// aqui la clase _HeightSelectorState que extiende de State<HeightSelector>
// para poder crear el estado del widget.
// esta clase es privada porque no la voy a utilizar en ningun otro lado
class _HeightSelectorState extends State<HeightSelector> {
  // aqui declaro una variable que se llama height y le asigno un valor de 150
  // esta variable es la que se va a utilizar para el slider
  double height = 150;

  // aqui declaro el metodo build en el cual vamos a crear e widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.tertiary,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("ALTURA", style: AppTextStyles.genderTitleSeleted),
              Text(
                "${widget.height.toStringAsFixed(0)} Cm",
                style: AppTextStyles.genderTitleSeleted,
              ),
              Slider(
                value: widget.height,
                onChanged: (valueChanged) {
                  /*setState(() {
                    height = valueChanged;
                  });*/
                  widget.onChangedHeight(valueChanged);
                },
                min: 150,
                max: 220,
                divisions: 70,
                activeColor: AppColors.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
