import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/add_new_task_screen.dart';
import 'package:todo_app/widgets/todo_item.dart';

import '../view_models/add_new_task_view_model.dart';
import '../view_models/todos_view_model.dart';
import '../widgets/todos_screen_header.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodosViewModel>().fetchTodoList();
  }

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
                    _buildTodoList(
                      todoList: unCompletedTodos,
                      onToggleCheckBox: (todo) {
                        todosViewModel.toggleTodoStatus(todo);
                      },
                    ),
                    if (completedTodos.isNotEmpty) _buildCompletedSeparator(),
                    _buildTodoList(
                      todoList: completedTodos,
                      onToggleCheckBox: (todo) {
                        todosViewModel.toggleTodoStatus(todo);
                      },
                    ),
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

  Widget _buildTodoList({
    required List<Todo> todoList,
    required Function(Todo todo) onToggleCheckBox,
  }) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Color(0xffE5E9ED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: List.generate(
            todoList.isEmpty ? 0 : todoList.length * 2 - 1,
            (index) {
              if (index.isOdd) {
                return SizedBox(height: 1);
              } else {
                final todo = todoList[index ~/ 2];
                return TodoItem(todo: todo, onToggleCheckBox: onToggleCheckBox);
              }
            },
          ),
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
}
