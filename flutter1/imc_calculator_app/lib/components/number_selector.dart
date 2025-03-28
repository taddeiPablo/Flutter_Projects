import 'package:flutter/material.dart';
import 'package:imc_calculator_app/core/app_colors.dart';
import 'package:imc_calculator_app/core/app_text_styles.dart';

//
class NumberSelector extends StatefulWidget {
  final String title;
  final int value;

  //
  const NumberSelector({super.key, required this.title, required this.value});

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
      child: Column(
        children: [
          Text(widget.title, style: AppTextStyles.genderTitleSeleted),
          Text(
            widget.value.toString(),
            style: AppTextStyles.genderTitleSeleted,
          ),
          Row(
            children: [
              FloatingActionButton(
                onPressed: () {},
                shape: CircleBorder(),
                backgroundColor: AppColors.tertiary,
                child: Icon(Icons.remove, color: AppColors.quaternary),
              ),
              FloatingActionButton(
                onPressed: () {},
                shape: CircleBorder(),
                backgroundColor: AppColors.tertiary,
                child: Icon(Icons.add, color: AppColors.quaternary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
