import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  final String? descript;

  const DescriptionCard({super.key, required this.descript});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Text(
        descript!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
