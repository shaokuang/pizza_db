import 'package:flutter/material.dart';

class GHome extends StatefulWidget {
  @override
  _GHomeState createState() => _GHomeState();
}

class _GHomeState extends State<GHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text('Game Home Screen'),
        ),
        body: Text('Body'),
      
    );
  }
}