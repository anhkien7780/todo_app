import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/category_button.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white),
        height: 80,
        width: 358,
        child: Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CategoryButton(category: widget.todo.category, isSelected: false,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.todo.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (widget.todo.time != null)
                    Text(
                      widget.todo.time!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff1B1B1D).withAlpha(170),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = !isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
