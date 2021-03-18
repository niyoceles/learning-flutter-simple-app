import 'package:flutter/material.dart';
import 'package:myapplication/pages/home_page.dart';
// import './randomWords.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple[900]),
        home: HomeScreen());
  }
}
