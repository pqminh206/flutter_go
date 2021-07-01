import 'dart:async';
import 'dart:math';
import 'package:flutter_go/base/base_bloc.dart';
import 'package:flutter_go/base/base_event.dart';
import 'package:flutter_go/event/add_todo_event.dart';
import 'package:flutter_go/event/delete_todo_event.dart';
import 'package:flutter_go/model/todo.dart';

class TodoBloc extends BaseBloc {
  StreamController<List<Todo>> _todoListStreamController =
      StreamController<List<Todo>>();
  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  var _randomInt = Random();
  List<Todo> _todoListData = [];

  _addTodo(Todo todo) {
    _todoListData.add(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  _deleteTodo(Todo todo) {
    _todoListData.remove(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddTodoEvent) {
      Todo todo = new Todo(_randomInt.nextInt(10000), event.content);
      _addTodo(todo);
    } else if (event is DeleteTodoEvent) {
      _deleteTodo(event.todo);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _todoListStreamController.close();
  }
}
