import 'package:flutter/widgets.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/todo.dart';

class TodosViewModel extends ChangeNotifier {
  List<Todo> completedTodos = <Todo>[
    Todo(title: "title", category: Category.event, isCompleted: true),
  ];

  List<Todo> unCompletedTodos = <Todo>[];

  void addNewTodo(Todo todo) {
    unCompletedTodos.add(todo);
    notifyListeners();
  }

  void toggleTodoStatus(Todo todo){
    if(todo.isCompleted == false){
      int index = unCompletedTodos.indexOf(todo);
      if(index != -1){
        unCompletedTodos.removeAt(index);
        todo.isCompleted = true;
        completedTodos.add(todo);
      }
    } else{
      int index = completedTodos.indexOf(todo);
      if(index != -1){
        completedTodos.removeAt(index);
        todo.isCompleted = false;
        unCompletedTodos.add(todo);
      }
    }
    notifyListeners();
  }
}
