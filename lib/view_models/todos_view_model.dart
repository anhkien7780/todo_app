import 'package:flutter/widgets.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/networks/supabase_services.dart';

class TodosViewModel extends ChangeNotifier {
  List<Todo> completedTodos = <Todo>[];

  List<Todo> unCompletedTodos = <Todo>[];


  Future<void> fetchTodoList() async {
    final response = await SupabaseServices.supabaseClient
        .from("todos")
        .select();
    final todos = response.map((todo) => Todo.fromJson(todo)).toList();

    completedTodos = todos.where((todo) => todo.isCompleted).toList();
    unCompletedTodos = todos.where((todo) => !todo.isCompleted).toList();

    notifyListeners();
  }

  Future<void> addNewTask(Todo todo) async {
    try {
      final response = await SupabaseServices.supabaseClient
          .from("todos")
          .insert(todo)
          .select();
      final todos = response.map((todo) => Todo.fromJson(todo)).toList();
      unCompletedTodos.add(todos.first);

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> toggleTodoStatus(Todo todo) async {
    try {
      final response = await SupabaseServices.supabaseClient
          .from("todos")
          .update({"is_completed": todo.isCompleted ? false : true})
          .eq("id", todo.id)
          .select();
      final todos = response.map((todo) => Todo.fromJson(todo)).toList();
      if(todo.isCompleted){
        completedTodos.remove(todo);
        unCompletedTodos.add(todos.first);
      } else {
        unCompletedTodos.remove(todo);
        completedTodos.add(todos.first);
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
