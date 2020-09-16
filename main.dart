import 'package:flutter/material.dart';

void main() {
  runApp(Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(
      "Linha1",
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 50),
    ),
    Text(
      "Linha2",
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 50),
    ),
    Text(
      "Linha3",
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 50),
    ),
    Row(
      textDirection: TextDirection.ltr,
      children: [
        Text(
          "Linha4",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 50, color: Colors.blue),
        ),
        Text(
          "Linha5",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 50, color: Colors.green),
        ),
      ],
    )
  ])));
}
