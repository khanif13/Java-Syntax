import 'package:flutter/material.dart';
import 'package:java_syntax/detail_page.dart';
import 'package:java_syntax/main.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    List<String> bookmarked = sharedPrefs.getStringList("bookmark") ?? [];
    List<String> namaTombol = bookmarked
        .map((e) => e
            .split("_")
            .map((e) => "${e[0].toUpperCase()}${e.substring(1).toLowerCase()}")
            .join(" "))
        .toList();
    List<String> assets = bookmarked.map((e) => "assets/materi/$e.md").toList();

    return Scaffold(
      backgroundColor: Color(0xFF151522),
      appBar: AppBar(
        backgroundColor: Color(0xFF282836),
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text("Bookmark"),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: bookmarked.isEmpty
          ? Center(
              child: Container(),
            )
          : ListView.separated(
              padding: EdgeInsets.all(15.0),
              itemBuilder: (context, index) => BookmarkCard(
                title: namaTombol[index],
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                          title: namaTombol[index],
                          asset: assets[index],
                          index: index),
                    ),
                  );
                  setState(() {});
                },
                onDeletePressed: () async {
                  List<String> current =
                      sharedPrefs.getStringList("bookmark") ?? [];
                  current.remove(bookmarked[index]);
                  await sharedPrefs.setStringList("bookmark", current);
                  setState(() {});
                },
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 10.00,
              ),
              itemCount: namaTombol.length,
            ),
    );
  }
}

class BookmarkCard extends StatelessWidget {
  const BookmarkCard(
      {super.key,
      required this.title,
      required this.onDeletePressed,
      this.onPressed});
  final String title;
  final Function()? onDeletePressed;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Material(
        color: Color(0xFFEAEAFF),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                IconButton(
                  onPressed: onDeletePressed,
                  icon: Icon(Icons.delete_outline),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
