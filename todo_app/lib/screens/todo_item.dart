import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo item"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                hintText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _descricaoController,
              decoration: InputDecoration(
                hintText: 'Descrição',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              height: 50,
              minWidth: double.infinity,
              child: RaisedButton(
                onPressed: () => {},
                color: Colors.green,
                textColor: Colors.white,
                child: Text(
                  "Salvar",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
