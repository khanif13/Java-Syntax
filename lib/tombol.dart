import 'package:flutter/material.dart';

class Tombol extends StatelessWidget {
  const Tombol({super.key, required this.text, required this.onPressed});
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Transform.scale(
                  scale: -1,
                  child: Image.asset("assets/bracket.png"),
                ),
                Image.asset(
                  "assets/java.png",
                  width: 35,
                ),
                SizedBox(
                  width: 2.0,
                ),
                Image.asset("assets/bracket.png")
              ],
            ),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: Image.asset(
            //     'assets/images/Logo.png',
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
          SizedBox(height: 8), // Spasi antara gambar dan teks
          Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
