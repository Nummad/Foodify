//SIgn in and sign up buttons on the main screen

import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  const buttons({
    this.text = "",
    this.colour = Colors.white,
  });
  final String text;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colour,
      ),
      height: 50,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
