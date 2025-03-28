//
import 'package:flutter/material.dart';
import 'package:imc_calculator_app/core/app_colors.dart';
import 'package:imc_calculator_app/core/app_text_styles.dart';

//
class HeightSelector extends StatefulWidget {
  //
  const HeightSelector({super.key});

  //
  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

//
class _HeightSelectorState extends State<HeightSelector> {
  double height = 150;

  //
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
                "${height.toStringAsFixed(0)} Cm",
                style: AppTextStyles.genderTitleSeleted,
              ),
              Slider(
                value: height,
                onChanged: (valueChanged) {
                  setState(() {
                    height = valueChanged;
                  });
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
