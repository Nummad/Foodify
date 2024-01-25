import 'package:flutter/material.dart';
import 'package:foodify/homepage.dart';
import 'loadingPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
      // home: loadingPage(),
    );
  }
}
