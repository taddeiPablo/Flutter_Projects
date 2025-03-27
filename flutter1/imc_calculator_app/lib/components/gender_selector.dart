//
import 'package:flutter/material.dart';
import 'package:imc_calculator_app/core/app_colors.dart';
import 'package:imc_calculator_app/core/app_text_styles.dart';

//
class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});
  //
  @override
  State<GenderSelector> createState() => _GenderSelectedState();
}

//
class _GenderSelectedState extends State<GenderSelector> {
  //
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // como tarea agregar un container a las dos columnas
        Column(
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
        Column(
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
      ],
    );
  }
}
