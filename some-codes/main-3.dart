import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Linha 1"),
        Text("Linha 2"),
        Card(
          child: ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("Linha 3"),
              subtitle: Text("Aqui é a linha 3")),
        ),
        Card(
          child: ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("Linha 4"),
              subtitle: Text("Aqui é a linha 4")),
        ),
        Card(
          child: ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("Linha 5"),
              subtitle: Text("Aqui é a linha 5")),
        ),
           Card(
          child: ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("Linha 5"),
              subtitle: Text("Aqui é a linha 5")),
        ),
           Card(
          child: ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("Linha 5"),
              subtitle: Text("Aqui é a linha 5")),
        ),
           Card(
          child: ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("Linha 5"),
              subtitle: Text("Aqui é a linha 5")),
        ),
           Card(
          child: ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("Linha 5"),
              subtitle: Text("Aqui é a linha 5")),
        ),
      ],
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Lista de Compras"),
            leading: Icon(Icons.ac_unit),
            actions: [
              Icon(Icons.ac_unit),
              Icon(Icons.ac_unit),
            ]),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                title: Text('Home'), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text('Lista'), icon: Icon(Icons.access_alarm)),
            BottomNavigationBarItem(
                title: Text('Lista'), icon: Icon(Icons.looks_two)),
          ],
          currentIndex: 1,
        ),
        body: HomeBody());
  }
}
