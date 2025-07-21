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
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final todosViewModel = context.read<TodosViewModel>();
    List<Todo> completedTodos = context.watch<TodosViewModel>().completedTodos;
    List<Todo> unCompletedTodos = context
        .watch<TodosViewModel>()
        .unCompletedTodos;
    return SafeArea(
      child: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(child: TodosScreenHeader()),
            Positioned.fill(
              top: 158,
              child: Padding(
                padding: EdgeInsets.only(bottom: 100, right: 16, left: 16),
                child: ListView(
                  children: [
                    _buildTodoList(
                      context: context,
                      todoList: unCompletedTodos,
                      onToggleCheckBox: (todo) {
                        todosViewModel.toggleTodoStatus(todo);
                      },
                    ),
                    if (completedTodos.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          "Completed",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    _buildTodoList(
                      context: context,
                      todoList: completedTodos,
                      onToggleCheckBox: (todo) {
                        todosViewModel.toggleTodoStatus(todo);
                      },
                    ),
                  ],
                ),
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
    required BuildContext context,
    required List<Todo> todoList,
    required Function(Todo todo) onToggleCheckBox,
  }) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        addAutomaticKeepAlives: false,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(todoList[index].id),
            onDismissed: (direction) {
              context.read<TodosViewModel>().removeTodoTask(todoList[index]);
            },
            child: TodoItem(
              todo: todoList[index],
              onToggleCheckBox: onToggleCheckBox,
            ),
          );
        },
        separatorBuilder: (_, _) =>
            Divider(height: 1, color: Color(0xffE5E9ED)),
        itemCount: todoList.length,
      ),
    );
  }
}
