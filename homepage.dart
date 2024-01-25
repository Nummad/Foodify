import 'package:flutter/material.dart';
import 'package:foodify/product.dart';
import 'constants.dart';
import 'mainCategory.dart';
import 'items.dart';

const backGroundColor = Color(0xFF0A0E21);

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text(
          'Menu',
          style: kAppBarTitle,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 15),
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: mainCategory(
                text: 'Fast Food',
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return product(
                          text: 'Pizza',
                          imageName: 'images/pizza.jpeg',
                          Price: 500,
                          // imageName: AssetImage('images/pizza.jpeg'),
                        );
                      })));
                    },
                    child: items(
                      imageName: AssetImage('images/pizza.jpeg'),
                      price: 500,
                      name: 'Pizza',
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return product(
                          text: 'Burger',
                          imageName: 'images/burger.jpeg',
                          Price: 200,
                          //imageName: AssetImage('images/burger.jpeg'),
                        );
                      })));
                    },
                    child: items(
                      imageName: AssetImage('images/burger.jpeg'),
                      price: 200,
                      name: 'Burger',
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return product(
                          text: 'Pasta',
                          imageName: 'images/pasta.jpeg',
                          Price: 300,
                          // imageName: AssetImage('images/pasta.jpeg'),
                        );
                      })));
                    },
                    child: items(
                      imageName: AssetImage('images/pasta.jpeg'),
                      price: 300,
                      name: 'Pasta',
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return product(
                          text: 'Nuggets',
                          imageName: 'images/chicken.jpeg',
                          Price: 100,
                          // imageName: AssetImage('images/chicken.jpeg'),
                        );
                      })));
                    },
                    child: items(
                      imageName: AssetImage('images/chicken.jpeg'),
                      price: 100,
                      name: 'Nuggets',
                    ),
                  ),
                ],
              ),
            ),
            //End of first list e.g. fast food
            //start of second list desi
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: mainCategory(
                text: 'Local Food',
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return product(
                          text: 'Biryani',
                          imageName: 'images/biryani.jpeg',
                          Price: 500,
                          // imageName: AssetImage('images/biryani.jpeg'),
                        );
                      })));
                    },
                    child: items(
                      imageName: AssetImage('images/biryani.jpeg'),
                      price: 500,
                      name: 'Biryani',
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return product(
                          text: 'Karahi',
                          imageName: 'images/karahi.jpeg',
                          Price: 200,
                          // imageName: AssetImage('images/karahi.jpeg'),
                        );
                      })));
                    },
                    child: items(
                      imageName: AssetImage('images/karahi.jpeg'),
                      price: 200,
                      name: 'Karahi',
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return product(
                          text: 'Palao',
                          imageName: 'images/palao.jpeg',
                          Price: 300,
                          // imageName: AssetImage('images/palao.jpeg'),
                        );
                      })));
                    },
                    child: items(
                      imageName: AssetImage('images/palao.jpeg'),
                      price: 300,
                      name: 'Palao',
                    ),
                  ),
                ],
              ),
            ),
            //End of second list e.g. desi food
            //start of third list e.g. itlian
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: mainCategory(
                text: 'Sweet dish',
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return product(
                          text: 'Kheer',
                          imageName: 'images/kheer.jpeg',
                          Price: 500,
                          // imageName: AssetImage('images/kheer.jpeg'),
                        );
                      })));
                    },
                    child: items(
                      imageName: AssetImage('images/kheer.jpeg'),
                      price: 500,
                      name: 'Kheer',
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return product(
                          text: 'Custard',
                          imageName: 'images/custard.jpeg',
                          Price: 200,
                          // imageName: AssetImage('images/custard.jpeg'),
                        );
                      })));
                    },
                    child: items(
                      imageName: AssetImage('images/custard.jpeg'),
                      price: 200,
                      name: 'Custard',
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return product(
                          text: 'Chaat',
                          Price: 300,
                          imageName: 'images/Chaat.jpeg',
                          // imageName: AssetImage('images/Chaat.jpeg'),
                        );
                      })));
                    },
                    child: items(
                      imageName: AssetImage('images/Chaat.jpeg'),
                      price: 300,
                      name: 'Chaat',
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return product(
                          text: 'Ice cream',
                          // imageName: AssetImage('images/icecream.jpeg'),
                          imageName: 'images/icecream.jpeg',
                          Price: 100,
                        );
                      })));
                    },
                    child: items(
                      imageName: AssetImage('images/icecream.jpeg'),
                      price: 100,
                      name: 'Ice cream',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
