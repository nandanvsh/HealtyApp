import 'package:flutter/material.dart';
import 'package:healtyapps/navbar.dart';
import 'package:healtyapps/page_one.dart';
import 'package:healtyapps/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins"),
      home: Start(),
    );
  }
}
