import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Cartao extends StatelessWidget {
  final String nome;
  final String email;

  Cartao({this.nome, this.email});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey,
        child: ListTile(
          title: Text(this.nome),
          subtitle: Text(this.email),
        ));
  }
}

class Home extends StatefulWidget {
  @override
  HomeSate createState() {
    return HomeSate();
  }
}

class HomeSate extends State<Home> {
  List<Cartao> listaCartoes = List();
  int numero = 0;

  void adicionaCartoes() {
    numero = numero + 1;
    listaCartoes.add(
        Cartao(nome: "($numero) José de Alencar", email: "jose@uol.com.br"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de contatos"),
        leading: Icon(Icons.home),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(adicionaCartoes);
        },
        child: Text("+"),
      ),
      body: ListView.builder(
        itemCount: listaCartoes.length,
        itemBuilder: (context, index) {
          return listaCartoes[index];
        },
      ),
    );
  }
}
