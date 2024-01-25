import 'package:flutter/material.dart';
import 'package:foodify/login.dart';
import 'buttons.dart';
import 'constants.dart';
import 'Logo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text(
          'Sign up',
          style: kAppBarTitle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(),
            SizedBox(height: 50),
            TextField(
              onChanged: (value) {
                email = value;
              },
              style: TextStyle(color: Colors.white),
              obscureText: false,
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey.shade500),
                hintText: 'Enter your email',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                password = value;
              },
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey.shade500),
                hintText: 'Enter your password',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                try {
                  final newUser = await auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return login();
                    }));
                  }
                } catch (e) {
                  print(e);
                }
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return login();
                // }));
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


// textField(
//   val: password,
//   Text: 'Enter your password',
// ),