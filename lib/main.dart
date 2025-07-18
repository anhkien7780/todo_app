import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/networks/supabase_services.dart';
import 'package:todo_app/screens/todos_screen.dart';
import 'package:todo_app/view_models/todos_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseServices.supabaseInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
