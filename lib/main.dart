import 'package:flutter/material.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/widgets/todo_item.dart';

import 'models/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {"/": (context) => TodosScreen()},
    );
  }
}

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      body: Center(
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TodoItem(
              todo: Todo(
                title: "Task title",
                time: "23:12",
                category: Category.task,
                isCompleted: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
