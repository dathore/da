import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myloginapp/home.dart';
import 'package:myloginapp/navbar.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor("001224"),
        primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
        textTheme: Typography(platform: TargetPlatform.iOS).white,
      ),
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}
