import 'package:flutter/material.dart';
import 'Logo.dart';
import 'buttons.dart';
import 'constants.dart';
import 'homepage.dart';
import 'cart.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'mainScreen.dart';

class lastPage extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text(
          'Order placed !!!',
          style: kTextSttyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(height: 200),
            Logo(),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                cart.item = [];
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return homepage();
                }));
              },
              child: buttons(
                text: 'Order again',
                colour: Colors.green,
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                auth.signOut();
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return mainScreen();
                }));
              },
              child: buttons(
                text: 'Log out',
                colour: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
