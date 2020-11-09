import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/Todo.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;

  TodoItem({Key key, @required this.todo}) : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState(todo);


}

class _TodoItemState extends State<TodoItem> {
  Todo _todo;
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();

  _TodoItemState(Todo todo) {
    this._todo = todo;
    if (_todo != null) {
      _tituloController.text = _todo.titulo;
      _descricaoController.text = _todo.descricao;
    }
  }



  _saveItem() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var data = preferences.getString("list");
    List<Todo> list = [];
    if (data != null) {
      var objs = jsonDecode(data) as List;
      list = objs.map((e) => Todo.fromJson(e)).toList();
    }
    _todo =
        Todo.preencheCampos(_tituloController.text, _descricaoController.text);
    list.add(_todo);

    preferences.setString('list', jsonEncode(list));
  }

  @override
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
                onPressed: _saveItem,
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
