import 'package:flutter/material.dart';
import 'package:java_syntax/home.dart';
import 'package:java_syntax/main.dart';

class UsernameInput extends StatefulWidget {
  const UsernameInput({super.key});

  @override
  State<UsernameInput> createState() => _UsernameInputState();
}

class _UsernameInputState extends State<UsernameInput> {
  final usernameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151522),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Java Syntax",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            Text(
              "Let's get started on your coding journey.\nWhat's your name?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            TextField(
              controller: usernameCtrl,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: usernameCtrl.text.isEmpty
                  ? null
                  : () async {
                      await sharedPrefs.setString(
                          "username", usernameCtrl.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF282836),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              child: Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
