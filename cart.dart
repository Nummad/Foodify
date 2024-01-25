import 'package:flutter/material.dart';
import 'package:foodify/homepage.dart';
import 'package:foodify/items.dart';
import 'package:foodify/constants.dart';
import 'dynamicList.dart';
import 'finalPage.dart';

const orderFont = TextStyle(
  fontSize: 23,
  fontWeight: FontWeight.bold,
);

class cart extends StatefulWidget {
  cart(
      {required this.name,
      required this.numberCount,
      required this.price,
      required this.size,
      required this.imageName});
  static List<cart> item = [];
  static int index = 0;
  String imageName;
  String name = '';
  int price = 0;
  int numberCount = 0;
  String size = '';

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  int addPrices() {
    int sum = cart.item[0].price;
    for (int i = 1; i < cart.item.length; i++) {
      print('Addprices called');
      sum = sum + cart.item[i].price;
      print(sum);
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text(
          'Ordered items',
          style: kTextSttyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(15),
              ),
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.all(15),
                children: [
                  Text(
                    'Your order',
                    style: kTextSttyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 150,
                    child: DynamicList(
                      name: widget.name,
                      imageName: widget.imageName,
                      price: widget.price,
                      size: widget.size,
                      numberCount: widget.numberCount,
                      item: cart.item,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    cart.item = [];
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.delete,
                    size: 40,
                  ),
                ),
                cartButton(
                  iconshape: Icons.add,
                  num: 1,
                  nextpage: homepage(),
                ),
                FloatingActionButton(
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.done,
                      size: 40,
                    ),
                    heroTag: 'btn2',
                    onPressed: () {
                      // if (cart.item.length > 1) {
                      //   print('L ${cart.item.length}');
                      //   cart.item.removeLast();
                      // }
                      print('Length : ${cart.item.length}');
                      // else
                      //   cart.item.length = cart.item.length - 2;
                      int sum = addPrices();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return finalPage(
                          finalItems: cart.item,
                          totalPrice: sum,
                          // finalItems: cart.item,
                          name: widget.name,
                          imageName: widget.imageName,
                          price: widget.price,
                          size: widget.size,
                          numberCount: widget.numberCount,
                        );
                      }));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class cartButton extends StatelessWidget {
  const cartButton({
    required this.iconshape,
    required this.num,
    required this.nextpage,
  });
  final Widget nextpage;
  final int num;
  final IconData iconshape;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Color(0xFF4C4F5E),
        child: Icon(
          iconshape,
          size: 40,
        ),
        heroTag: 'btn$num',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return nextpage;
          }));
        });
  }
}

// class DynamicList extends StatefulWidget {
//   DynamicList({
//     this.name = '',
//     this.numberCount = 0,
//     this.price = 0,
//     this.size = '',
//     this.imageName = '',
//     required this.item,
//   });
//   List<cart> item;
//   String imageName;
//   String name = '';
//   int price = 0;
//   int numberCount = 0;
//   String size = '';
//   @override
//   State<DynamicList> createState() => _DynamicListState(
//         name: name,
//         imageName: imageName,
//         price: (numberCount * price),
//         numberCount: numberCount,
//         size: size,
//         item: item,
//       );
// }

// class _DynamicListState extends State<DynamicList> {
//   _DynamicListState({
//     this.name = '',
//     this.numberCount = 0,
//     this.price = 0,
//     this.size = '',
//     this.imageName = '',
//     required this.item,
//   });
//   late List<cart> item;
//   String imageName;
//   String name = '';
//   int price = 0;
//   int numberCount = 0;
//   String size = '';

//   @override
//   void initState() {
//     setState(() {
//       item.add(cart(
//           name: name,
//           numberCount: numberCount,
//           price: (price),
//           size: size,
//           imageName: imageName));
//       // print(item.length);
//       //for (int i = 0; i < item.length; i++) {
//       // print('$i ${item[i].name}');
//       // print(item[i].price);
//       // }
//     });
//   }

//   Widget build(BuildContext context) {
//     int countIndex = 0;
//     return Container(
//       height: 400,
//       child: ListView.builder(
//         itemCount: item.length,
//         itemBuilder: (context, index) {
//           return Row(
//             children: [
//               Image(
//                 image: AssetImage(item[countIndex].imageName),
//                 width: 150,
//               ),
//               SizedBox(width: 20),
//               Column(
//                 children: [
//                   Text(item[countIndex].name, style: orderFont),
//                   SizedBox(height: 5),
//                   Text(
//                     item[countIndex].size,
//                     style: orderFont,
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     item[countIndex].numberCount.toString(),
//                     style: orderFont,
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     item[countIndex < item.length - 1
//                             ? countIndex++
//                             : countIndex]
//                         .price
//                         .toString(),
//                     style: orderFont,
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:foodify/homepage.dart';
// import 'package:foodify/items.dart';
// import 'package:foodify/constants.dart';

// const orderFont = TextStyle(
//   fontSize: 23,
//   fontWeight: FontWeight.bold,
// );

// class cart extends StatelessWidget {
//   cart(
//       {required this.name,
//       required this.numberCount,
//       required this.price,
//       required this.size,
//       required this.imageName});
//   static List<cart> item = [];
//   static int index = 0;
//   String imageName;
//   String name = '';
//   int price = 0;
//   int numberCount = 0;
//   String size = '';

//   void setVal(
//       String Name, String Size, int PRice, int NumberCount, String image) {
//     cart.item.add(
//       cart(
//         name: Name,
//         numberCount: NumberCount,
//         size: Size,
//         price: PRice,
//         imageName: image,
//       ),
//     );

//     index++;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF0A0E21),
//       appBar: AppBar(
//         backgroundColor: Color(0xFF0A0E21),
//         title: Text(
//           'Ordered items',
//           style: kTextSttyle,
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.all(15),
//             color: Color(0xFF1D1E33),
//             width: double.infinity,
//             height: 150,
//             child: Container(
//               color: Colors.white,
//               // width: 150,
//               height: 150,
//               child: ListView.builder(
//                 itemCount: item.length,
//                 itemBuilder: (context, index) {
//                   return DynamicList(
//                     price: item[index].price,
//                     name: item[index].name,
//                     imageName: item[index].imageName,
//                     size: item[index].size,
//                     numberCount: item[index++].numberCount,
//                     item: item,
//                   );
//                 },
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             flex: 1,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 FloatingActionButton(
//                     backgroundColor: Colors.green,
//                     child: Text(
//                       'Add',
//                     ),
//                     // backgroundColor: Color(0xFF4C4F5E),
//                     heroTag: 'btn2',
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                         return homepage();
//                       }));
//                       //setVal(name, size, price, numberCount, imageName);
//                       // for (int i = 0; i < cart.index; i++) {
//                       //   print('$i ${cart.item[i].name}');
//                       //   print('$i ${cart.item[i].numberCount}');
//                       //   print('$i ${cart.item[i].price}');
//                       //   print('$i ${cart.item[i].size}');
//                       // }
//                     }),
//                 FloatingActionButton(
//                     backgroundColor: Color(0xFF4C4F5E),
//                     heroTag: 'btn1',
//                     onPressed: () {
//                       // setVal(name, size, price, numberCount, imageName);
//                       for (int i = 0; i < cart.index; i++) {
//                         print('$i ${cart.item[i].name}');
//                         print('$i ${cart.item[i].numberCount}');
//                         print('$i ${cart.item[i].price}');
//                         print('$i ${cart.item[i].size}');
//                       }
//                     }),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DynamicList extends StatefulWidget {
//   DynamicList({
//     this.name = '',
//     this.numberCount = 0,
//     this.price = 0,
//     this.size = '',
//     this.imageName = '',
//     required this.item,
//   });
//   List<cart> item;
//   String imageName;
//   String name = '';
//   int price = 0;
//   int numberCount = 0;
//   String size = '';
//   @override
//   State<DynamicList> createState() => _DynamicListState(
//         name: name,
//         imageName: imageName,
//         price: price,
//         numberCount: numberCount,
//         size: size,
//         item: item,
//       );
// }

// class _DynamicListState extends State<DynamicList> {
//   _DynamicListState({
//     this.name = '',
//     this.numberCount = 0,
//     this.price = 0,
//     this.size = '',
//     this.imageName = '',
//     required this.item,
//   });
//   late List<cart> item;
//   String imageName;
//   String name = '';
//   int price = 0;
//   int numberCount = 0;
//   String size = '';
//   int index = 0;
//   @override
//   void initState() {
//     setState(() {
//       item.add(cart(
//           name: name,
//           numberCount: numberCount,
//           price: price,
//           size: size,
//           imageName: imageName));
//     });
//   }

//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Image(
//           image: AssetImage(item[index].imageName),
//           width: 150,
//         ),
//         SizedBox(width: 20),
//         Column(
//           children: [
//             Text(name, style: orderFont),
//             SizedBox(height: 5),
//             Text(
//               widget.size,
//               style: orderFont,
//             ),
//             SizedBox(height: 5),
//             Text(
//               numberCount.toString(),
//               style: orderFont,
//             ),
//             SizedBox(height: 5),
//             Text(
//               price.toString(),
//               style: orderFont,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
