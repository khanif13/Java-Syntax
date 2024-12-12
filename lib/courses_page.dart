import 'package:flutter/material.dart';
import 'package:java_syntax/course_card.dart';
import 'package:java_syntax/detail_page.dart';
import 'package:java_syntax/main.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    DateTime appStart = DateTime.parse(sharedPrefs.getString("app_start")!);
    DateTime now = DateTime.now();
    int difference = now.difference(appStart).inMinutes;
    int time = difference > 60 ? 60 : difference;
    Future.delayed(Duration.zero, () async {
      await sharedPrefs.setInt("time", time);
    });

    List namaTombol = materis
        .map((e) => e
            .split("/")
            .last
            .split("_")
            .map((e) => "${e[0].toUpperCase()}${e.substring(1).toLowerCase()}")
            .join(" ")
            .split(".md")
            .first)
        .toList();
    List<String> opened = sharedPrefs.getStringList("opened") ?? [];

    return Scaffold(
      backgroundColor: const Color(0xFF151522),
      appBar: AppBar(
        backgroundColor: const Color(0xFF151522),
        elevation: 0,
        title: const Text(
          "My Courses",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF272B40),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Learned Today",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "$time/60min",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LinearProgressIndicator(
                    value: time / 60, // Nilai progres
                    backgroundColor: Colors.grey,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF4CAF50)), // Warna hijau
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: namaTombol.length,
                itemBuilder: (context, index) {
                  double current = sharedPrefs.getDouble(keys[index]) ?? 0;
                  double max = sharedPrefs.getDouble("${keys[index]}_max") ?? 0;
                  double progress = current / max;
                  return CourseCard(
                    progress: progress.isNaN ? 0 : progress,
                    title: namaTombol[index],
                    onPlayPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          maintainState: false,
                          builder: (context) => DetailPage(
                            index: index,
                            title: namaTombol[index],
                            asset: materis[index],
                            offset: current,
                          ),
                        ),
                      );
                      if (!opened.contains(keys[index])) {
                        await sharedPrefs
                            .setStringList("opened", [...opened, keys[index]]);
                      }
                      setState(() {});
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
