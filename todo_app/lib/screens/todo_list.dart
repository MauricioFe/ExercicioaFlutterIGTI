import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var list = ['Teste1', 'teste 2', 'teste 3'];

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
              title: Text(list[index]),
              subtitle: Text(list[index]),
              onTap: () => {},
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: ()=>{},
      ),
    );
  }
}
