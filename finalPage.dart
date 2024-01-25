import 'buttons.dart';
import 'package:flutter/material.dart';
import 'lastPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';
import 'cart.dart';
import 'dynamicList2.dart';

class finalPage extends StatelessWidget {
  final user = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  finalPage(
      {required this.totalPrice,
      required this.finalItems,
      required this.name,
      required this.numberCount,
      required this.price,
      required this.size,
      required this.imageName});
  final int totalPrice;
  List<cart> finalItems = [];
  //static int index = 0;
  String imageName;
  String name = '';
  int price = 0;
  int numberCount = 0;
  String size = '';
  String phone = '', address = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text(
          'Billing',
          style: kTextSttyle,
        ),
      ),
      body: Padding(
        //padding: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              width: double.infinity,
              height: 160,
              child: DynamicList(
                name: name,
                imageName: imageName,
                price: price,
                size: size,
                numberCount: numberCount,
                item: finalItems,
              ),
            ),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              height: 60,
              child: Center(
                child: Text(
                  'Total bill : $totalPrice',
                  style: kTextSttyle,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              onChanged: (value) {
                phone = value;
              },
              style: TextStyle(color: Colors.white),
              obscureText: false,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey.shade500),
                hintText: 'Enter your phone number',
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
            ),
            SizedBox(height: 15),
            TextField(
              onChanged: (value) {
                address = value;
              },
              style: TextStyle(color: Colors.white),
              obscureText: false,
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey.shade500),
                hintText: 'Enter delivery address',
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
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                String tempName = '',
                    tempSize = '',
                    tempPrice = '',
                    tempQuantity = '';
                for (int i = 0; i < finalItems.length; i++) {
                  tempName += finalItems[i].name;
                  tempSize += finalItems[i].size;
                  tempPrice += finalItems[i].price.toString();
                  tempQuantity += finalItems[i].numberCount.toString();
                  if (i != finalItems.length - 1) {
                    tempName += ' , ';
                    tempSize += ' , ';
                    tempPrice += ' , ';
                    tempQuantity += ' , ';
                  }
                }
                firestore.collection('items').add({
                  'total-bill': totalPrice,
                  'item-name': tempName,
                  'item-size': tempSize,
                  'item-quantity': tempQuantity,
                  'item-cost': tempPrice,
                  'phone-num': phone,
                  'location': address,
                });
                if (address != '' && phone != '') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return lastPage();
                  }));
                }
                print('Order placed');
              },
              child: buttons(
                text: 'Place order',
                colour: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
