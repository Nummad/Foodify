import 'package:flutter/material.dart';
import 'constants.dart';

class mainCategory extends StatelessWidget {
  mainCategory({
    this.text = "",
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF1D1E33),
      ),
      padding: EdgeInsets.all(35),
      height: 100,
      width: 250,
      // color: Colors.green,
      child: Center(
        child: Text(
          text,
          style: kTextSttyle,
        ),
      ),
    );
  }
}
