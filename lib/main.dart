import 'package:flutter/material.dart';
import 'package:ptow/Pages/Login_Page.dart';

void main() {
  runApp(MyApp());
}

String token = "";
String url = "http://10.0.2.2:8000/api";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dr.You',

      home: Login_Page(),
    );
  }

  static of(BuildContext context) {}
}
