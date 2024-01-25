import 'package:flutter/material.dart';
import 'mainScreen.dart';
import 'Logo.dart';
import 'Logo.dart';

class loadingPage extends StatefulWidget {
  @override
  State<loadingPage> createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  void changeScreen(double value) {
    if (value == 1) {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return mainScreen();
      }));
    }
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    controller.forward();
    controller.addListener(() {
      setState(() {
        changeScreen(controller.value);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 300),
              Logo(),
              Text(
                '${(controller.value * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
