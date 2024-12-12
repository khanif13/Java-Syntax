import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(
      {super.key,
      required this.progress,
      required this.title,
      this.onPlayPressed});
  final double progress;
  final String title;
  final Function()? onPlayPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF272B40), // Warna latar belakang kotak
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul kursus
            SizedBox(
              width: double.infinity,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            // Status penyelesaian kursus
            // Text(
            //   "Completed ${course.completed}/${course.total}",
            //   style: TextStyle(color: Colors.white, fontSize: 14),
            // ),
            // SizedBox(height: 8),
            // Bar progres
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF4CAF50)), // Warna hijau
            ),
            Spacer(),
            // Tombol play
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(99),
                child: Material(
                  color: Color(0xFF3B5BFF), // Warna biru tombol
                  child: InkWell(
                    onTap: onPlayPressed,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child:
                          Icon(Icons.play_arrow, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
