import 'package:flutter/material.dart';
import 'package:java_syntax/BookmarkPage.dart';
import 'package:java_syntax/CoursesPage.dart';
import 'package:java_syntax/HomePage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexTerpilih = 0;

  List halaman = [
    HomePage(),
    CoursesPage(),
    BookmarkPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: halaman[indexTerpilih],
      backgroundColor: Color(0xFF151522),
      bottomNavigationBar: NavigationBar(
        selectedIndex: indexTerpilih,
        onDestinationSelected: (index) {
          setState(() {
            indexTerpilih = index;
          });
        },
        backgroundColor: Color(0xFF151522),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.book),
            label: "Bookmark",
            selectedIcon: Icon(
              Icons.book,
              color: Colors.white,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book),
            label: "Courses",
            selectedIcon: Icon(
              Icons.menu_book,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
