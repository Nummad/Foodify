import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'Icon',
          child: Icon(
            Icons.restaurant,
            color: Colors.grey.shade600,
            size: 70,
          ),
        ),
        SizedBox(width: 30),
        Text(
          'Foodify',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
