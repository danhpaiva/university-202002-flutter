import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: MyWidget()),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        alignment: Alignment.center,
        width: 200,
        height: 200,
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        child: Text('Hello, World!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.withOpacity(0.9),
              fontSize: 30,
              decoration: TextDecoration.underline,
            )));
  }
}
