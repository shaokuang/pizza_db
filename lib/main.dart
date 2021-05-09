import 'package:flutter/material.dart';
import 'package:pizza_db/game/g_home.dart';
import 'package:pizza_db/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomeScreen(),
      home: GHome(),
    );
  }
}




