import 'package:flutter/material.dart';
import 'package:flutter_go/todo/todo_header.dart';
import 'package:flutter_go/todo/todo_list.dart';

class TodoListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TodoHeader(),
          Expanded(child: TodoList()),
        ],
      ),
    );
  }
}
