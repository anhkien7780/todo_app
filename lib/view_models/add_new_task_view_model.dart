import 'package:flutter/widgets.dart';
import 'package:todo_app/models/category.dart';

import '../models/todo.dart';

class AddNewTaskViewModel extends ChangeNotifier {
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

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
    if(date != null){
      dateController.text = date;
    }
    if(time != null){
      timeController.text = time;
    }
    notifyListeners();
  }
}
