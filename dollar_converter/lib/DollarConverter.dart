import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DollarConverter extends StatefulWidget {
  @override
  _DollarConverterState createState() => _DollarConverterState();
}

class _DollarConverterState extends State<DollarConverter> {
  final TextEditingController _reaisController = TextEditingController();
  final TextEditingController _cotacaoDollarController =
      TextEditingController();
  var resultado = '';
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reais para dólares'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 30, bottom: 20),
              child: Image.asset(
                "assets/pay.png",
                width: 150,
              )),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              //é a partir do controller que eu consigo manipular os dados dentro dele
              controller: _reaisController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: "Valor em reais",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              //é a partir do controller que eu consigo manipular os dados dentro dele
              controller: _cotacaoDollarController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: "Cotação do Dólar",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  padding: EdgeInsets.all(10),
                  color: Color.fromRGBO(217, 17, 54, 1),
                  onPressed: clearInputs,
                  child: Text(
                    "Limpar",
                    style: TextStyle(fontSize: 30),
                  )),
              FlatButton(
                  padding: EdgeInsets.all(10),
                  color: Color.fromRGBO(3, 166, 90, 1),
                  onPressed: handleCalculated,
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 30),
                  ))
            ],
          ),
          Opacity(
            opacity: opacity,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                        title: Text(
                      "$resultado",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  clearInputs() {
    _cotacaoDollarController.text = '';
    _reaisController.text = '';
    setState(() {
      resultado = '';
      opacity = 0;
    });
  }

  handleCalculated() {
    var reais = double.parse(_reaisController.text);
    var cotacaoDollar = double.parse(_cotacaoDollarController.text);
    setState(() {
      opacity = 1.0;
      resultado =
          'Com $reais é possível comprar \$ ${(reais / cotacaoDollar).toStringAsFixed(2)} dólares a $cotacaoDollar cada';
    });
  }
}
