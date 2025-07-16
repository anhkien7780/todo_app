
import 'package:flutter/widgets.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/todo.dart';

class TodosViewModel extends ChangeNotifier{
  List<Todo> completedTodos = <Todo>[
    Todo(title: "Task Title", category: Category.task, isCompleted: true),
    Todo(title: "Task Title", category: Category.task, isCompleted: true),
    Todo(title: "Task Title", category: Category.task, isCompleted: true),
    Todo(title: "Task Title", category: Category.task, isCompleted: true),
    Todo(title: "Task Title", category: Category.task, isCompleted: true),
    Todo(title: "Task Title", category: Category.task, isCompleted: true),
    Todo(title: "Task Title", category: Category.task, isCompleted: true),
    Todo(title: "Task Title", category: Category.task, isCompleted: true),
    Todo(title: "Task Title", category: Category.task, isCompleted: true),
    Todo(title: "Task Title", category: Category.task, isCompleted: true),
    Todo(title: "Task Title", category: Category.task, isCompleted: true),
    Todo(title: "Task Title", category: Category.task, isCompleted: true),
    Todo(title: "Task Title", category: Category.task, isCompleted: true),
  ];


  List<Todo> unCompletedTodos = <Todo>[
    Todo(title: "Task Title", category: Category.task, isCompleted: false),
    Todo(title: "Task Title", category: Category.task, isCompleted: false),
    Todo(title: "Task Title", category: Category.task, isCompleted: false),
    Todo(title: "Task Title", category: Category.task, isCompleted: false),
    Todo(title: "Task Title", category: Category.task, isCompleted: false),
    Todo(title: "Task Title", category: Category.task, isCompleted: false),
    Todo(title: "Task Title", category: Category.task, isCompleted: false),
    Todo(title: "Task Title", category: Category.task, isCompleted: false),
    Todo(title: "Task Title", category: Category.task, isCompleted: false),
    Todo(title: "Task Title", category: Category.task, isCompleted: false),
    Todo(title: "Task Title", category: Category.task, isCompleted: false),
    Todo(title: "Task Title", category: Category.task, isCompleted: false),
    Todo(title: "Task Title", category: Category.task, isCompleted: false),
  ];
}