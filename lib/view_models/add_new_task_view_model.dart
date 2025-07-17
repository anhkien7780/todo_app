import 'package:flutter/widgets.dart';
import 'package:todo_app/models/category.dart';

import '../models/todo.dart';

class AddNewTaskViewModel extends ChangeNotifier {
  Todo todo = Todo(title: "", category: Category.task, isCompleted: false);

  void updateCategory(Category category) {
    todo.category = category;
    notifyListeners();
  }

  void updateOnly({
    String? title,
    Category? category,
    String? date,
    String? time,
    String? note,
  }) {
    todo
      ..title = title ?? todo.title
      ..category = category ?? todo.category
      ..date = date ?? todo.date
      ..time = time ?? todo.time
      ..note = note ?? todo.note;
    notifyListeners();
  }
}
