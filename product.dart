import 'package:flutter/material.dart';
import 'constants.dart';
import 'cart.dart';

const Color selectedSize = Color(0xFF4C4F5E);

class product extends StatefulWidget {
  product({
    this.text = '',
    required this.imageName,
    this.Price = 0,
  });
  String text;
  String imageName;
  int Price;
  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  int count = 0;
  String size = '';
  int actualPrice = 0; //price as per the size
  int priceChecker(String size, int count) {
    actualPrice = (size == 'Small' && count != 0)
        ? widget.Price
        : (size == 'Medium' && count != 0)
            ? (widget.Price + 250)
            : (size == 'Large' && count != 0)
                ? (widget.Price + 400)
                : 0;
    return actualPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text(
          widget.text,
          style: kAppBarTitle,
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 30),
              onPressed: () {
                if (actualPrice != 0) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return cart(
                      name: widget.text,
                      price: actualPrice,
                      size: size,
                      numberCount: count,
                      imageName: widget.imageName,
                    );
                  }));
                }
              },
              icon: Icon(
                Icons.done,
                color: Colors.white,
                size: 40,
              )),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        widget.text,
                        style: kitemsText,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Small : ${widget.Price}',
                        style: kitemsText,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Medium : ${(widget.Price + 250)}',
                        style: kitemsText,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Large : ${(widget.Price + 400)}',
                        style: kitemsText,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: AssetImage(widget.imageName),
                        height: 200,
                        alignment: Alignment.centerRight,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF1D1E33),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Item size : $size',
                      style: kTextSttyle,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          heroTag: 'btn3',
                          backgroundColor: Color(0xFF4C4F5E),
                          child: Center(
                            child: Text(
                              'S',
                              style: kTextSttyle,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              size = 'Small';
                            });
                          },
                        ),
                        FloatingActionButton(
                          heroTag: 'btn5',
                          backgroundColor: selectedSize,
                          child: Center(
                            child: Text(
                              'M',
                              style: kTextSttyle,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              size = 'Medium';
                            });
                          },
                        ),
                        FloatingActionButton(
                          heroTag: 'btn4',
                          backgroundColor: selectedSize,
                          child: Center(
                            child: Text(
                              'L',
                              style: kTextSttyle,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              size = 'Large';
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF1D1E33),
                ),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Items : $count',
                      style: kTextSttyle,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          heroTag: 'btn1',
                          backgroundColor: Color(0xFF4C4F5E),
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              size: 30,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (count != 0) count--;
                              priceChecker(size, count);
                            });
                          },
                        ),
                        FloatingActionButton(
                          heroTag: 'btn2',
                          backgroundColor: Color(0xFF4C4F5E),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              count++;
                              priceChecker(size, count);
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF1D1E33),
                  ),
                  child: Center(
                    child: Text(
                      'Total price : ${count * priceChecker(size, count)}',
                      style: kTextSttyle,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
