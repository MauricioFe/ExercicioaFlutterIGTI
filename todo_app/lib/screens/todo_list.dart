import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/Todo.dart';
import 'package:todo_app/screens/todo_item.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> list = [];

  @override
  void initState() {
    super.initState();
    _reloadList();
  }

  _reloadList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = preferences.getString("list");
    if (data != null) {
      var objs = jsonDecode(data) as List;
      setState(() {
        list = objs.map((e) => Todo.fromJson(e)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${list[index].titulo}'),
              subtitle: Text('${list[index].descricao}'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        TodoItem(todo: list[index], index: index)),
              ).then((value) => _reloadList()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => {},
                  ),
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () => {},
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TodoItem(todo: null, index: -1)),
        ).then((value) => _reloadList()),
      ),
    );
  }
}
