import 'package:flutter/material.dart';
import 'login.dart';
import 'buttons.dart';
import 'signup.dart';
import 'Logo.dart';

class mainScreen extends StatefulWidget {
  @override
  State<mainScreen> createState() => _mainSCreenState();
}

class _mainSCreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
            SizedBox(height: 70),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return login();
                }));
              },
              child: buttons(
                text: 'Sign in',
                colour: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return signup();
                }));
              },
              child: buttons(
                text: 'Sign up',
                colour: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
