import 'package:flutter/material.dart';

class Tombol extends StatelessWidget {
  const Tombol({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/Logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8), // Spasi antara gambar dan teks
        Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
