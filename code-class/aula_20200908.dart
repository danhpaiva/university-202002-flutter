import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}


class CartaoPersonalizado extends StatelessWidget{
  
  final String titulo;
  final String subtitulo;
  
  CartaoPersonalizado( { this.titulo, this.subtitulo } );
  
  @override
  Widget build(BuildContext context){
    
    return   
        Card(
          color: Colors.blue, 
          child: ListTile( 
                    hoverColor: Colors.green,
                    leading:            Image.network("https://www.una.br/app/themes/mobister/dist/images/logo.svg", 
                      width: 150/3,
                      height: 50/3,
                      ),
                    title: Text( this.titulo ), 
                    subtitle: Text( this.subtitulo ),
           )
        );
  }
}


class HomeBody extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
    return ListView(
      children: [
        
         Image.network("https://www.una.br/app/themes/mobister/dist/images/logo.svg", 
                      width: 150/3,
                      height: 50/3,
                      ),
        
         CartaoPersonalizado( titulo: 'Linha 1 ', subtitulo: "Aqui tem  o dado da linha 1"),
         CartaoPersonalizado( titulo: 'Linha 2 ', subtitulo: ""),
         CartaoPersonalizado( titulo: 'Linha 3 ', subtitulo: "Dado da linha 3"),
       
      ],
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Lista de compras"),
          leading: Icon(Icons.ac_unit),
          actions: [
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(title: Text('Home'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text('Lista'), icon: Icon(Icons.access_alarm)),
          BottomNavigationBarItem(
              title: Text('Lista'), icon: Icon(Icons.looks_two)),
        ],
        currentIndex: 1,
      ),
      
      body: HomeBody(), 
      
    );
  }
}