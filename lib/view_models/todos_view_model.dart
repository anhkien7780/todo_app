import 'package:flutter/widgets.dart';
import 'package:todo_app/models/todo.dart';

class TodosViewModel extends ChangeNotifier {
  List<Todo> completedTodos = <Todo>[];

  List<Todo> unCompletedTodos = <Todo>[];

  void addNewTodo(Todo todo) {
    unCompletedTodos.add(todo);
    notifyListeners();
  }
}
