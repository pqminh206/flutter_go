import 'package:flutter_go/base/base_event.dart';
import 'package:flutter_go/model/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  Todo todo;

  DeleteTodoEvent(this.todo);
}
