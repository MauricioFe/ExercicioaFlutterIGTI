import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Imc extends StatefulWidget {
  @override
  _ImcState createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  // o underscore significa que o campo é privado.
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculo IMC"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset("assets/escala.png", width: 150),
          TextField(
            //é a partir do controller que eu consigo manipular os dados dentro dele
            controller: _alturaController,
            decoration: InputDecoration(
              hintText: "Altura",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              icon: Icon(Icons.accessibility),
            ),
          ),
          TextField(
            //é a partir do controller que eu consigo manipular os dados dentro dele
            controller: _pesoController,
            decoration: InputDecoration(
              hintText: "Peso",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              icon: Icon(Icons.person),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.clear)),
          BottomNavigationBarItem(icon: Icon(Icons.check)),
        ],
      ),
    );
  }
}
