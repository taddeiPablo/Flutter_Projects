import 'package:flutter/material.dart';
import 'package:imc_calculator_app/core/app_colors.dart';
import 'package:imc_calculator_app/core/app_text_styles.dart';

//
class NumberSelector extends StatefulWidget {
  final String title;
  final int value;
  // funcion por la cual vamos a incrementar el valor
  final Function() onIncrement;
  // funcion por la cual vamos a restar el valor
  final Function() onDecrement;
  //
  const NumberSelector({
    super.key,
    required this.title,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  //
  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

//
class _NumberSelectorState extends State<NumberSelector> {
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.quinary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(widget.title, style: AppTextStyles.genderTitleSeleted),
            Text(
              widget.value.toString(),
              style: AppTextStyles.genderTitleSeleted,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // boton de restar
                FloatingActionButton(
                  onPressed: () {
                    widget.onDecrement();
                  },
                  shape: CircleBorder(),
                  backgroundColor: AppColors.tertiary,
                  child: Icon(Icons.remove, color: AppColors.quaternary),
                ),
                SizedBox(width: 16),
                // boton de sumar
                FloatingActionButton(
                  onPressed: () {
                    widget.onIncrement();
                  },
                  shape: CircleBorder(),
                  backgroundColor: AppColors.tertiary,
                  child: Icon(Icons.add, color: AppColors.quaternary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
