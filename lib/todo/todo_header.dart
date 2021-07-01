import 'package:flutter/material.dart';
import 'package:flutter_go/bloc/todo_bloc.dart';
import 'package:flutter_go/event/add_todo_event.dart';
import 'package:provider/provider.dart';

class TodoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtTodoController = TextEditingController();
    var bloc = Provider.of<TodoBloc>(context);

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: txtTodoController,
            decoration: InputDecoration(labelText: 'Add todo'),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton.icon(
            onPressed: () {
              bloc.event.add(AddTodoEvent(txtTodoController.text));
              txtTodoController.text = "";
            },
            icon: Icon(Icons.add),
            label: Text("Add"))
      ],
    );
  }
}
