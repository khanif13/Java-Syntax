import 'package:flutter/material.dart';
import 'package:java_syntax/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({required this.course});

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
            Text(
              course.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Status penyelesaian kursus
            Text(
              "Completed ${course.completed}/${course.total}",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(height: 8),
            // Bar progres
            LinearProgressIndicator(
              value: course.total > 0
                  ? course.completed / course.total
                  : 0.0, // Menangani pembagian dengan 0
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF4CAF50)), // Warna hijau
            ),
            Spacer(),
            // Tombol play
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFF3B5BFF), // Warna biru tombol
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.play_arrow, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
