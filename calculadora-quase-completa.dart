import 'package:flutter/material.dart';

double valor;
String operacao;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.green,
      ),
      home: Scaffold(
        body: Corpo(),
        appBar: AppBar(title: Text("Calculadora")),
      ),
    );
  }
}

class Botao extends StatelessWidget {
  String titulo = "";
  TextEditingController textController;

  Botao(String titulo, TextEditingController textController) {
    this.titulo = titulo;
    this.textController = textController;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: Container(
          padding: EdgeInsets.all(4),
          height: 120,
          child: RaisedButton(
              child: Text(titulo),
              onPressed: () {
                textController.text = textController.text + titulo;
              }),
        ));
  }
}

class BotaoOperacao extends StatelessWidget {
  String titulo = "";
  TextEditingController textController;

  BotaoOperacao(String titulo, TextEditingController textController) {
    this.titulo = titulo;
    this.textController = textController;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: Container(
          padding: EdgeInsets.all(4),
          height: 120,
          child: RaisedButton(
              child: Text(titulo),
              onPressed: () {
                 
                  if( titulo == "="){
                    double valorAtual = double.tryParse( textController.text );
                    double resultado;
                    
                    switch( operacao ){
                        case  "+": resultado = valor + valorAtual; break;
                        case  '-': resultado = valor - valorAtual; break;
                        case  '*': resultado = valor * valorAtual; break;
                        case  '/': resultado = valor / valorAtual; break;
                    }
                    
                    textController.text = resultado.toString();
                    
                    
                  } else {
                     operacao = this.titulo;
                
                     valor = double.tryParse( textController.text );
                    
                     textController.text = "";
                  }
              }),
        ));
  }
}


class BotaoZero extends StatelessWidget {
  TextEditingController textController;

  BotaoZero(TextEditingController textController) {
    this.textController = textController;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: Container(
            padding: EdgeInsets.all(4),
            height: 120,
            child: RaisedButton(
                child: Text("0"),
                onPressed: () {
                  textController.text = textController.text + "0";
                })));
  }
}

class Corpo extends StatelessWidget {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(controller: textController),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Row(
              children: [
                Botao("7", textController),
                Botao("8", textController),
                Botao("9", textController),
                BotaoOperacao("-", textController),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Row(
              children: [
                Botao("4", textController),
                Botao("5", textController),
                Botao("6", textController),
                BotaoOperacao("+", textController),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Row(
              children: [
                Botao("1", textController),
                Botao("2", textController),
                Botao("3", textController),
                BotaoOperacao("*", textController),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Row(
              children: [
                BotaoZero( textController ),
                Botao("CE", textController),
                BotaoOperacao("=", textController),
                BotaoOperacao("/", textController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
