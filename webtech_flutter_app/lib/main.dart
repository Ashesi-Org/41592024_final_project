import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/signup.dart';
import 'package:webtech_flutter_app/postpage.dart';
import 'package:webtech_flutter_app/loginpage.dart';
import 'package:webtech_flutter_app/editprofile.dart';
import 'package:webtech_flutter_app/viewprofile.dart';
import 'package:webtech_flutter_app/feedpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(   
      home: Home(),
    );
  }
}
