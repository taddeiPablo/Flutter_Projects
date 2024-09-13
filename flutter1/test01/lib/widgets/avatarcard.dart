import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            "P",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text("Pablo Taddei",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black26))
      ],
    );
  }
}
