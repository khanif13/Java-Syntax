import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:java_syntax/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List<String> materis;
late SharedPreferencesWithCache sharedPrefs;
late List<String> keys;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final manifestContent = await AssetManifest.loadFromAssetBundle(rootBundle);

  materis = manifestContent
      .listAssets()
      .where((e) => e.startsWith("assets/materi/"))
      .toList();
  keys = materis.map((e) => e.split("/").last.split(".md").first).toList();
  List<String> allowList = keys.map((e) => e).toList();
  List<String> allowListMax = allowList.map((e) => "${e}_max").toList();
  allowList.addAll(allowListMax);
  allowList.addAll(["last_recorded", "time", "app_start", "opened"]);
  sharedPrefs = await SharedPreferencesWithCache.create(
    cacheOptions: SharedPreferencesWithCacheOptions(
      allowList: allowList.toSet(),
    ),
  );

  final now = DateTime.now();
  final currentDay = now.toIso8601String().split('T').first;
  final lastRecordedDay = sharedPrefs.getString('last_recorded') ?? currentDay;
  final appStart = sharedPrefs.getString("app_start");

  if (appStart == null) {
    sharedPrefs.setString('app_start', now.toIso8601String());
    sharedPrefs.setString("last_recorded", lastRecordedDay);
    sharedPrefs.setInt("time", 0);
  }

  if (lastRecordedDay != currentDay) {
    sharedPrefs.setInt('time', 0);
    sharedPrefs.setString('app_start', now.toIso8601String());
    sharedPrefs.setString('last_recorded', currentDay);
  }

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

