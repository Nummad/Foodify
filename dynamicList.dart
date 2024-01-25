import 'package:flutter/material.dart';
import 'constants.dart';
import 'cart.dart';

class DynamicList extends StatefulWidget {
  DynamicList({
    this.name = '',
    this.numberCount = 0,
    this.price = 0,
    this.size = '',
    this.imageName = '',
    required this.item,
  });
  late List<cart> item;
  String imageName;
  String name = '';
  int price = 0;
  int numberCount = 0;
  String size = '';
  @override
  State<DynamicList> createState() => _DynamicListState(
        name: name,
        imageName: imageName,
        price: (numberCount * price),
        numberCount: numberCount,
        size: size,
        item: item,
      );
}

class _DynamicListState extends State<DynamicList> {
  _DynamicListState({
    this.name = '',
    this.numberCount = 0,
    this.price = 0,
    this.size = '',
    this.imageName = '',
    required this.item,
  });
  late List<cart> item;
  String imageName;
  String name = '';
  int price = 0;
  int numberCount = 0;
  String size = '';

  @override
  void initState() {
    setState(() {
      item.add(cart(
          name: name,
          numberCount: numberCount,
          price: (price),
          size: size,
          imageName: imageName));
      // print(item.length);
      //for (int i = 0; i < item.length; i++) {
      // print('$i ${item[i].name}');
      // print(item[i].price);
      // }
    });
  }

  Widget build(BuildContext context) {
    int countIndex = 0;
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(item[countIndex].imageName),
                width: 150,
              ),
              SizedBox(width: 30),
              Column(
                children: [
                  Text('${item[countIndex].name}', style: orderFont),
                  SizedBox(height: 5),
                  Text(
                    '${item[countIndex].size}',
                    style: orderFont,
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${item[countIndex].numberCount}',
                    style: orderFont,
                  ),
                  SizedBox(height: 5),
                  Text(
                    item[countIndex < item.length - 1
                            ? countIndex++
                            : countIndex]
                        .price
                        .toString(),
                    style: orderFont,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
