import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  var quantidade = 0;

  incrementar() {
    setState(() {
      quantidade++;
    });
  }

  decrementar() {
    setState(() {
      quantidade--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contador"),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Quantidade",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Text(
                    "$quantidade",
                    style: TextStyle(fontSize: 20),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                          onPressed: incrementar,
                          child: Text(
                            "Incrementar",
                            style: TextStyle(fontSize: 20),
                          )),
                      FlatButton(
                          onPressed: decrementar,
                          child: Text(
                            "Decrementar",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
