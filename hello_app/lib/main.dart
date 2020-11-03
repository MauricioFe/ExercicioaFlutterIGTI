import 'package:flutter/material.dart';

void main() {
  runApp(Hello());
}

TesteButton() {
  debugPrint("Clicou");
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              width: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hello", style: TextStyle(fontSize: 40.0)),
                ),
                Text("Mauricio!", style: TextStyle(fontSize: 40.0)),
              ],
            ),
            FlatButton(
              onPressed: TesteButton,
              child: Text(
                "Teste",
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.lightGreen,
            ),
            Container(
              color: Colors.amber,
              width: 300,
              height: 200,
              alignment: Alignment.center,
              child: Text(
                "Texto dentro do container",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
