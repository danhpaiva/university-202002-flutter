import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[300],
          accentColor: Colors.yellow,
          secondaryHeaderColor: Colors.red,
          fontFamily: 'Georgia',
          buttonColor: Colors.red,
          textTheme: TextTheme(
              bodyText1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.lime))),
      home: Scaffold(
        appBar: AppBar(title: Text("Trabalhando com os temas")),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('Hello, World!', style: Theme.of(context).textTheme.bodyText1),
      RaisedButton(child: Text('Texto do botão'), onPressed: () {}),
    ]);
  }
}
