import 'package:flutter/material.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/atom-one-dark.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class CodeElementBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    var language = 'java';

    return SizedBox(
      width: element.attributes['class'] != null
          ? MediaQueryData.fromView(WidgetsBinding.instance.window).size.width
          : null,
      child: HighlightView(
        // The original code to be highlighted
        element.textContent,

        // Specify language
        // It is recommended to give it a value for performance
        language: language,

        // Specify highlight theme
        // All available themes are listed in `themes` folder
        theme: atomOneDarkTheme,

        // Specify padding
        padding: element.attributes['class'] != null
            ? const EdgeInsets.all(8)
            : EdgeInsets.symmetric(horizontal: 2),
        textStyle: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
