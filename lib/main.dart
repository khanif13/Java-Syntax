import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:java_syntax/home.dart';

late List<String> materis;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final manifestContent = await AssetManifest.loadFromAssetBundle(rootBundle);

  materis = manifestContent
      .listAssets()
      .where((e) => e.startsWith("assets/materi/"))
      .toList();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Java Syntax',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
