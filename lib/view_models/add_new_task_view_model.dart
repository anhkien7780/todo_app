import 'package:flutter/widgets.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/view_models/todos_view_model.dart';

import '../models/todo.dart';

class AddNewTaskViewModel extends ChangeNotifier {
  late final TodosViewModel todosViewModel;

  AddNewTaskViewModel({required this.todosViewModel});

  Todo todo = Todo(taskTitle: "", category: Category.task, isCompleted: false);

  void updateOnly({
    String? taskTitle,
    Category? category,
    String? date,
    String? time,
    String? note,
  }) {
    todo = todo.copyWith(
      taskTitle: taskTitle ?? todo.taskTitle,
      category: category ?? todo.category,
      date: date ?? todo.date,
      time: time ?? todo.time,
      note: note ?? todo.note,
    );
    notifyListeners();
  }
}
