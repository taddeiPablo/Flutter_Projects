import 'package:flutter/material.dart';

class LetterGrid extends StatelessWidget {
  final List<List<String>> grid;
  final void Function(int row, int col) onLetterTap;
  final List<Offset> selectedPosition;
  
  const LetterGrid({
    super.key, 
    required this.grid, 
    required this.onLetterTap, 
    required this.selectedPosition
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(grid.length, (row){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(grid[row].length, (col) {
            final isSelected = selectedPosition.contains(Offset(row.toDouble(), col.toDouble()));
            return GestureDetector(
              onTap: () => onLetterTap(row, col),
              child: Container(
                margin: const EdgeInsets.all(4),
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.grey[300],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  grid[row][col],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}