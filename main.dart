import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String currency = 'USD-BRL';
String day = '1';
String maiorValor = '';
String menorValor = '';

void main() {
  runApp(MonetaryMonitoring());
}

class MonetaryMonitoring extends StatefulWidget {
  @override
  _MonetaryMonitoringState createState() => _MonetaryMonitoringState();
}

class _MonetaryMonitoringState extends State<MonetaryMonitoring> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text('Acompanhamento Monetário'),
        ),
        body: Column(
          children: [
            Container(
              width: 400,
              child: Text(
                'Informe a moeda: ',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            Container(
              width: 400,
              child: DropDownMoney(),
            ),
            Container(
              width: 400,
              child: Text(
                'Informe o número de dias: ',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            Container(
              width: 400,
              child: DropDownDay(),
            ),
            Container(
              child: CardResult(maiorValor, menorValor),
            ),
            Container(
              child: RaisedButton(
                color: Colors.deepPurpleAccent,
                onPressed: () {
                  getData(currency, day).then((response) {
                    var jsonResponse = convert.jsonDecode(response.body);
                    maiorValor = jsonResponse[0]['high'];
                    menorValor = jsonResponse[0]['low'];
                    setState(() {
                      CardResult(maiorValor, menorValor);
                    });
                  });
                },
                child: const Text('Pegar Valor',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardResult extends StatefulWidget {
  final String highestValue, lowerValue;
  const CardResult(this.highestValue, this.lowerValue);

  @override
  CardResultState createState() => CardResultState();
}

class CardResultState extends State<CardResult> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      'Maior Valor:${widget.highestValue}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Menor Valor:${widget.lowerValue}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownDay extends StatefulWidget {
  @override
  _DropDownDayState createState() => _DropDownDayState();
}

class _DropDownDayState extends State<DropDownDay> {
  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        width: 500,
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          day = dropdownValue.toString();
        });
      },
      items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DropDownMoney extends StatefulWidget {
  @override
  _DropDownMoneyState createState() => _DropDownMoneyState();
}

class _DropDownMoneyState extends State<DropDownMoney> {
  String dropdownValue = 'USD-BRL';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        width: 500,
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          currency = dropdownValue.toString();
        });
      },
      items: <String>['USD-BRL', 'EUR-BRL', 'BTC-BRL']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

Future<http.Response> getData(currency, day) async {
  var url = 'https://economia.awesomeapi.com.br/json/daily/$currency/$day';
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Ocorreu um erro');
  }
}
