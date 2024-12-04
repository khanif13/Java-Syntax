import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:java_syntax/utils/code_element_builder.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.title, required this.asset});
  final String title;
  final String asset;

  Future<String> loadAsset(BuildContext context, String myAsset) async {
    return await DefaultAssetBundle.of(context).loadString(myAsset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151522),
      appBar: AppBar(
        backgroundColor: Color(0xFF282836),
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(title),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: loadAsset(context, asset),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          return Markdown(
            data: snapshot.data!,
            selectable: true,
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              a: TextStyle(color: Colors.white),
              p: TextStyle(color: Colors.white),
              h1: TextStyle(color: Colors.white),
              h2: TextStyle(color: Colors.white),
              h3: TextStyle(color: Colors.white),
              h4: TextStyle(color: Colors.white),
              h5: TextStyle(color: Colors.white),
              h6: TextStyle(color: Colors.white),
              em: TextStyle(color: Colors.white),
              strong: TextStyle(color: Colors.white),
              del: TextStyle(color: Colors.white),
              blockquote: TextStyle(color: Colors.white),
              img: TextStyle(color: Colors.white),
              checkbox: TextStyle(color: Colors.white),
            ),
            builders: {"code": CodeElementBuilder()},
          );
        },
      ),
    );
  }
}
