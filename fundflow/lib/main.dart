import 'package:flutter/material.dart';
import 'package:fundflow/button/navigation.dart';
import 'package:fundflow/screens/add.dart';
import 'package:fundflow/screens/home.dart';
import 'package:fundflow/screens/login.dart';
import 'package:fundflow/screens/register.dart';
import 'package:fundflow/screens/screen2.0/itemadd.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}