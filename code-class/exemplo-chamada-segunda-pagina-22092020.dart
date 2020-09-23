import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Página principal")),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Pagina2();
            })).then((objeto) {
              print(objeto.nome);
              print(objeto.email);
            });
          }),
    );
  }
}

class Contato {
  final String nome;
  final String email;

  Contato(this.nome, this.email);
}

class Pagina2 extends StatefulWidget {
  Pagina2State createState() {
    return Pagina2State();
  }
}

class Pagina2State extends State<Pagina2> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Página 2")),
      body: Column(children: [
        Text("Nome:"),
        TextField(controller: nomeController),
        Text("E-mail:"),
        TextField(controller: emailController),
        RaisedButton(
            child: Text("Voltar"),
            onPressed: () {
              Contato contato =
                  Contato(nomeController.text, emailController.text);

              Navigator.pop(context, contato);
            })
      ]),
    );
  }
}
