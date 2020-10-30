import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Consulta CEP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController cepController = TextEditingController();
  String _cep = "";
  String _logradouro = "";
  String _complemento = "";
  String _bairro = "";
  String _localidade = "";
  String _uf = "";

  Future<http.Response> buscaCep() async {
    String url = "https://viacep.com.br/ws/" + cepController.text + "/json/";
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Ocorreu um erro ao rcuperar o CEP informado!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: cepController,
              decoration: InputDecoration(hintText: "Informe o cep"),
              keyboardType: TextInputType.number,
              maxLength: 8,
            ),
            RaisedButton(
              child: Text("Consultar CEP"),
              onPressed: () {
                buscaCep().then((response) {
                  setState(() {
                    var objeto = jsonDecode(response.body);
                    _cep = objeto['cep'];
                    _logradouro = objeto['logradouro'];
                    _complemento = objeto['complemento'];
                    _bairro = objeto['bairro'];
                    _localidade = objeto['localidade'];
                    _uf = objeto['uf'];
                  });
                });
              },
            ),
            Text('CEP: $_cep'),
            Text('Logradouro: $_logradouro'),
            Text('Complemento: $_complemento'),
            Text('Bairro: $_bairro'),
            Text('Localidade: $_localidade'),
            Text('UF: $_uf'),
          ],
        ),
      ),
    );
  }
}
