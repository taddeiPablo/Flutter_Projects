import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  final String avatar;
  final String nombre;

  const AvatarCard({super.key, required this.avatar, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            avatar,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(nombre,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black26))
      ],
    );
  }
}
