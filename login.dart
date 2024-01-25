import 'package:flutter/material.dart';
import 'package:foodify/buttons.dart';
import 'constants.dart';
import 'homepage.dart';
import 'Logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text(
          'Sign in',
          style: kAppBarTitle,
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Logo(),
              SizedBox(height: 70),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                style: TextStyle(color: Colors.white),
                obscureText: false,
                decoration: InputDecoration(
                  hintStyle:
                      TextStyle(fontSize: 20, color: Colors.grey.shade500),
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
                  hintStyle:
                      TextStyle(fontSize: 20, color: Colors.grey.shade500),
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
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return homepage();
                      }));
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                child: buttons(
                  text: 'Sign in',
                  colour: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
