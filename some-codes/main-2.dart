import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Row(
        children: [
          Icon(Icons.camera),
          Text("Meu app material")
          ]
                     )),
      
      body: Column(
        children: [
          Text("Linha 1", style: TextStyle(color: Colors.redAccent)),
          Text("Linha 2"),
          Text("Linha 3"),
        ],
      ),
      
       floatingActionButton: FloatingActionButton(
     onPressed: null,
      tooltip: "Incluir Valores",
      child: Icon(Icons.add)
    )
    )
  ));
}

