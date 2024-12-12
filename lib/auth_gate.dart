import 'package:flutter/material.dart';
import 'package:java_syntax/home.dart';
import 'package:java_syntax/home_page.dart';
import 'package:java_syntax/main.dart';
import 'package:java_syntax/username_input.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: Color(0xFF151522),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      width: 200,
                    ),
                    Image.asset(
                      "assets/logo_type.png",
                      width: 200,
                    ),
                  ],
                ),
              ),
            );
          }

          String? username = sharedPrefs.getString("username");
          if (username == null) {
            return UsernameInput();
          } else {
            return HomeScreen();
          }
        });
  }
}
