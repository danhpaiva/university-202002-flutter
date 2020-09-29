import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column( children: [ 
      
       Row(
         children: [
              Flexible( flex: 1, fit: FlexFit.tight, child: Container( color: Colors.blue, child: 
                                                                      RaisedButton( child: Text("botão"), onPressed: (){} ) ) ),
              Flexible( flex: 1, fit: FlexFit.tight, child: Container( color: Colors.red, child: Text('Coluna 2 ') ) ),
              Flexible( flex: 1, fit: FlexFit.tight, child: Container( color: Colors.green, child: Text('Coluna 3 ') ) ),             
         ]
       ),
      
      
       Flexible( flex: 5, fit: FlexFit.tight, child:  Container( color: Colors.blue, child: Text('Linha 1 ') ) ),
       Flexible( flex: 2, fit: FlexFit.tight,child:  Container( color: Colors.teal, child: Text('Linha 2 ') ) ),
       Flexible(  flex:5, fit: FlexFit.tight,child:  Container( color: Colors.indigo, child: Text('Linha 3 ') ) ),
    ]);
  }
}
