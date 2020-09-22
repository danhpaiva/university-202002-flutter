import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  String mensagem = "";
  String descricao = "";

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  void calculaIMC() {
    double peso = double.tryParse(pesoController.text);
    double altura = double.tryParse(alturaController.text);
    double imc;

    imc = peso / (altura * altura);

    if (imc < 18.5) {
      descricao = "Baixo peso";
    } else {
      if (imc <= 24.9) {
        descricao = "Peso normal";
      } else {
        if (imc <= 29.9) {
          descricao = "Excesso de peso";
        } else {
          if (imc <= 34.9) {
            descricao = "Obesidade de Classe 1";
          } else {
            if (imc <= 39.9) {
              descricao = "Obesidade de Classe 2 ";
            } else {
              descricao = "Obesidade de Classe 3";
            }
          }
        }
      }
    }

    mensagem = "Imc: " + imc.toString();
    print(mensagem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trabalhando com textos")),
      body: Column(children: [
        Text("Peso: "),
        TextField(controller: pesoController),
        Text("Altura"),
        TextField(controller: alturaController),
        Text(mensagem),
        Text(descricao),
        RaisedButton(
            child: Text("Calcular"),
            onPressed: () {
              setState(calculaIMC);
            }),
      ]),
    );
  }
}
