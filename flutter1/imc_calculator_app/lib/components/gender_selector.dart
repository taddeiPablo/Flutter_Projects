// aqui importo las librerias necesarias para la creacion de la clase
// GenderSelector que en este caso va ser el componente de la parte
// superior de la app que sera la seleccion de genero.
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:imc_calculator_app/core/app_colors.dart';
import 'package:imc_calculator_app/core/app_text_styles.dart';

// aqui creo la clase GenderSelector que hereda de la clase StatefulWidget
// y que me permitira manejar estados.
// ademas notese que esta clase es publica.
class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});
  // aqui declaro el metodo createState que me permitira manejar estados.
  @override
  State<GenderSelector> createState() => _GenderSelectedState();
}

// aqui declaro la clase _GenderSelectedState que hereda de la clase State
// y que me permitira manejar los estados de la clase GenderSelector
// ademas esta clase es privada.
class _GenderSelectedState extends State<GenderSelector> {
  String? selected = "Male";
  Bool? isMaleSelected;

  // aqui creo el metodo build que me permitira construir el componente de
  // seleccion del genero.
  @override
  Widget build(BuildContext context) {
    return Row(
      //male
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selected = "Male";
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      selected == "Male"
                          ? AppColors.quinary
                          : AppColors.tertiary,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/male-gender.png',
                        width: 100,
                        height: 100,
                        color: AppColors.quaternary,
                      ),
                      Text("Male", style: AppTextStyles.genderTitleSeleted),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //famele
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selected = "Female";
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      selected == "Female"
                          ? AppColors.quinary
                          : AppColors.tertiary,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/female.png',
                        width: 100,
                        height: 100,
                        color: AppColors.quaternary,
                      ),
                      Text("Female", style: AppTextStyles.genderTitleSeleted),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
