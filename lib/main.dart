import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/TodosScreen.dart';
import 'package:todo_app/view_mdoels/TodosViewModel.dart';

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
      routes: {
        "/": (context) => ChangeNotifierProvider(
          create: (context) => TodosViewModel(),
          child: TodosScreen(),
        ),
      },
      initialRoute: "/",
    );
  }
}
