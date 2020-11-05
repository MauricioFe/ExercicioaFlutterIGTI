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
        backgroundColor: Colors.indigo,
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
        backgroundColor: Colors.indigo,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.clear, color: Colors.white),
              title: Text(
                "Limpar",
                style: TextStyle(color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.check, color: Colors.white),
              title: Text(
                "Calcular",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
