import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
        
        appBar: AppBar( title: Text('Trabalhando com formulários'))
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  MyWidgetSate createState(){
    return MyWidgetSate();
  }
}

class MyWidgetSate extends State<MyWidget>{
  
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey, 
        child: Column(     
          children: [
             TextFormField(
                decoration: InputDecoration( hintText: 'Informe o seu e-mail' ),
               
                onSaved: (value){
                  print(value); 
                },
               
                validator: (value){
                  if( value.isEmpty ){
                    return "Informe o e-mail";
                  }                
                  return null;
                }
             ),
            
            TextFormField(
              decoration: InputDecoration( hintText: 'Informe o ano de nascimento'),
              maxLength: 4,
              keyboardType: TextInputType.number,
              
              onSaved: (value){
                  print(value); 
              },
               
              
              validator: ( valor ){
                if( valor.isEmpty  ){
                  return "Informe o ano de nascimento";
                }
                
                DateTime dataHoraAtual = new DateTime.now();
                
                if( ( dataHoraAtual.year - 18 ) <  int.tryParse( valor ) ){
                  return "Acesso permitido apenas para maiores de 18 anos";
                }
                
                return null;
              }
            ),
            
            
            RaisedButton(
              child: Text("Enviar"),
              onPressed: (){
                 if( _formKey.currentState.validate() == true ){
                   print("O formulário não possui erros");
                   
                   _formKey.currentState.save();
                   
                 } else {
                   print("O formulário POSSUI erros");
                 }
              }
            ),
            
            RaisedButton(
              child: Text("Limpar"),
              onPressed:(){
                 _formKey.currentState.reset();
              }
            ),
          ]
        )
    );
  }
}
