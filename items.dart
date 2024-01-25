import 'package:flutter/material.dart';
import 'constants.dart';

class items extends StatelessWidget {
  items({
    required this.imageName,
    required this.price,
    this.name = '',
  });
  String name;
  int price;
  AssetImage imageName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(15),
      ),
      // height: 200,
      width: 200,
      child: Column(
        children: [
          Image(
            image: imageName,
            // height: 150,
            width: 150,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: kitemsText,
              ),
              Text(price.toString(), style: kitemsText),
            ],
          )
        ],
      ),
      // Text(
      //   '1',
      //   style: kAppBarTitle,
      // ),
    );
  }
}
