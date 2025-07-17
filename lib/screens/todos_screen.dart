import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/add_new_task_screen.dart';
import 'package:todo_app/widgets/todo_item.dart';

import '../view_models/add_new_task_view_model.dart';
import '../view_models/todos_view_model.dart';
import '../widgets/todos_screen_header.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todosViewModel = context.read<TodosViewModel>();
    List<Todo> completedTodos = context.watch<TodosViewModel>().completedTodos;
    List<Todo> unCompletedTodos = context
        .watch<TodosViewModel>()
        .unCompletedTodos;

    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      body: SafeArea(
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(child: TodosScreenHeader()),
              Positioned.fill(
                top: 158,
                child: ListView(
                  padding: EdgeInsets.only(bottom: 100, right: 16, left: 16),
                  addAutomaticKeepAlives: false,
                  children: [
                    _buildUncompletedTodoList(unCompletedTodos),
                    if (completedTodos.isNotEmpty) _buildCompletedSeparator(),
                    _buildCompletedTodoList(completedTodos),
                  ],
                ),
              ),
              Positioned(
                bottom: 24,
                right: 16,
                left: 16,
                child: _buildAskNewTask(context, todosViewModel),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAskNewTask(BuildContext context, TodosViewModel todosViewModel) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color(0xff4A3780)),
        fixedSize: WidgetStatePropertyAll(Size(358, 56)),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (context) {
            return ChangeNotifierProvider(
              create: (_) =>
                  AddNewTaskViewModel(todosViewModel: todosViewModel),
              child: AddNewTaskScreen(),
            );
          },
        );
      },
      child: Text(
        "Add New Task",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildUncompletedTodoList(List<Todo> unCompletedTodos) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Color(0xffE5E9ED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: List.generate(unCompletedTodos.length, (index) {
            return TodoItem(todo: unCompletedTodos[index]);
          }),
        ),
      ),
    );
  }

  Widget _buildCompletedSeparator() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Text(
        "Completed",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildCompletedTodoList(List<Todo> completedTodos) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Color(0xffE5E9ED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: List.generate(completedTodos.length, (index) {
            return TodoItem(todo: completedTodos[index]);
          }),
        ),
      ),
    );
  }
}
