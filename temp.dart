import 'package:flutter/material.dart';

class temp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(itemBuilder: (BuildContext context, int index) {
      return tempRect();
    }));
  }
}

class tempRect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
    );
  }
}
