import 'package:flutter/material.dart';
import 'package:java_syntax/detail_page.dart';
import 'package:java_syntax/main.dart';
import 'package:java_syntax/progress_card.dart';
import 'package:java_syntax/tombol.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    List namaCard = namaTombol;
    DateTime appStart = DateTime.parse(sharedPrefs.getString("app_start")!);
    DateTime now = DateTime.now();
    int difference = now.difference(appStart).inMinutes;
    int time = difference > 60 ? 60 : difference;
    Future.delayed(Duration.zero, () async {
      await sharedPrefs.setInt("time", time);
    });

    List<String> opened = sharedPrefs.getStringList("opened") ?? [];
    List cloneKeys = keys;
    int openedCount = opened.toSet().intersection(cloneKeys.toSet()).length;

    return Scaffold(
      backgroundColor: const Color(0xFF151522),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF282836),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 32,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Hi, User!",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Let's start learning",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFE8EBFA),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Learned today",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "My Courses",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5766F3),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${time}min / 60min",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: LinearProgressIndicator(
                      value: time / 60,
                      backgroundColor: const Color(0xFFFFFFFF),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF4AC983),
                      ),
                      minHeight: 6,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Categories",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 80,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    return Tombol(
                      text: namaTombol[index],
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            maintainState: false,
                            builder: (context) => DetailPage(
                              index: index,
                              title: namaTombol[index],
                              asset: materis[index],
                            ),
                          ),
                        );
                        if (!opened.contains(keys[index])) {
                          await sharedPrefs.setStringList(
                              "opened", [...opened, keys[index]]);
                        }
                        setState(() {});
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  itemCount: namaTombol.length),
            ),
            const SizedBox(
              height: 10,
            ),

            // Learning Plan
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Learning Plan",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // Learning Plan Box
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFEAEAFF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              value: openedCount / keys.length,
                              strokeWidth: 3,
                              backgroundColor: Color(0xFFF4F3FD),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF4AC983), // Warna progress
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Java Basics",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "$openedCount/${keys.length}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 12,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Row(
                  //       children: [
                  //         SizedBox(
                  //           width: 20,
                  //           height: 20,
                  //           child: CircularProgressIndicator(
                  //             value: 6 / 24,
                  //             strokeWidth: 3,
                  //             backgroundColor: Color(0xFFF4F3FD),
                  //             valueColor: AlwaysStoppedAnimation<Color>(
                  //               Color(0xFF4AC983), // Warna progress
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 8,
                  //         ),
                  //         Text(
                  //           "OOP",
                  //           style: TextStyle(
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     Text(
                  //       "6/24",
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.grey[700],
                  //       ),
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // Learning Progress
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Learning Progress",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 380,
              child: ListView.separated(
                itemCount: namaCard.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  double current = sharedPrefs.getDouble(keys[index]) ?? 0;
                  double max = sharedPrefs.getDouble("${keys[index]}_max") ?? 0;
                  double progress = current / max;
                  return Progresscard(
                    text: namaCard[index],
                    progress: progress.isNaN ? 0 : progress,
                    onResumePressed: () async {
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
            )
          ],
        ),
      ),
    );
  }
}
