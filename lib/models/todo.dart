import 'package:uuid/uuid.dart';

import 'category.dart';

class Todo {
  Uuid? id = Uuid();
  String title = "";
  Category category = Category.task;
  String? date;
  String? time;
  String? note;
  bool isCompleted = false;

  Todo({
    this.id,
    required this.title,
    required this.category,
    this.date,
    this.time,
    this.note,
    required this.isCompleted,
  });
}
