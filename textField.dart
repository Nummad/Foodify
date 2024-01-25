import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  textField({
    required this.Text,
    this.keyBoardType = TextInputType.text,
    this.val = '',
  });
  final String Text;
  String val;
  TextInputType keyBoardType;
  bool hidetext(String text) {
    if (Text == 'Enter your password' || Text == 'Enter your password again') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        print(value);
      },
      style: TextStyle(color: Colors.white),
      keyboardType: keyBoardType,
      obscureText: hidetext(Text),
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey.shade500),
        hintText: Text,
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
    );
  }
}
