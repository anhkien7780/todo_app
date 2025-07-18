import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view_models/add_new_task_view_model.dart';
import 'package:todo_app/widgets/custom_text_field.dart';
import 'package:todo_app/widgets/svg_image.dart';

import '../models/todo.dart';
import '../widgets/add_new_task_screen_header.dart';
import '../widgets/category_selector.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xffF1F5F9),
        child: Column(
          children: [
            AddNewTaskScreenHeader(
              onCloseButtonPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 24),
            _buildBody(context: context),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    AddNewTaskViewModel viewModel = context
                        .read<AddNewTaskViewModel>();
                    Todo todo = viewModel.todo;
                    viewModel.todosViewModel.addNewTask(todo);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff4A3780)),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    DateTime dateTime = DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Column(
            spacing: 24,
            children: [
              CustomTextField(
                title: "Task Title",
                maxLines: 1,
                hint: "Task Title",
                onChange: (value) {
                  context.read<AddNewTaskViewModel>().updateOnly(
                    taskTitle: value,
                  );
                },
              ),
              Consumer<AddNewTaskViewModel>(
                builder:
                    (
                      BuildContext context,
                      AddNewTaskViewModel viewModel,
                      Widget? child,
                    ) {
                      return CategorySelector(
                        selectedCategory: viewModel.todo.category,
                        onChange: (category) {
                          viewModel.updateOnly(category: category);
                        },
                      );
                    },
              ),
              Row(
                spacing: 8,
                children: [
                  CustomTextField(
                    hint: "Date",
                    title: "Date",
                    onChange: (newDate) {
                      context.read<AddNewTaskViewModel>().updateOnly(
                        date: newDate,
                      );
                    },
                    width: 175,
                    suffixIcon: IconButton(
                      onPressed: () {
                        _buildCupertinoDateTime(
                          context,
                          dateTime,
                          CupertinoDatePickerMode.date,
                          (newDate) {
                            context.read<AddNewTaskViewModel>().updateOnly(
                              date: newDate.toString(),
                            );
                          },
                        );
                      },
                      icon: SizedBox(
                        height: 20,
                        width: 20,
                        child: SVGImage(
                          imageUri: "lib/assets/icons/ic_calendar.svg",
                        ),
                      ),
                    ),
                    maxLines: 1,
                  ),
                  CustomTextField(
                    hint: "Time",
                    title: "Time",
                    onChange: (value) {
                      context.read<AddNewTaskViewModel>().updateOnly(
                        time: value,
                      );
                    },
                    width: 175,
                    suffixIcon: IconButton(
                      onPressed: () {
                        _buildCupertinoDateTime(
                          context,
                          dateTime,
                          CupertinoDatePickerMode.time,
                          (newTime) {
                            context.read<AddNewTaskViewModel>().updateOnly(
                              time: newTime.toString(),
                            );
                          },
                        );
                      },
                      icon: SizedBox(
                        height: 20,
                        width: 20,
                        child: SVGImage(
                          imageUri: "lib/assets/icons/ic_clock.svg",
                        ),
                      ),
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
              CustomTextField(
                hint: "Notes",
                title: "Notes",
                height: 177,
                onChange: (value) {
                  context.read<AddNewTaskViewModel>().updateOnly(note: value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _buildCupertinoDateTime(
    BuildContext context,
    DateTime initialDateTime,
    CupertinoDatePickerMode mode,
    ValueChanged<DateTime> onDateTimeChanged,
  ) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 200,
        color: Colors.white,
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: initialDateTime,
            mode: mode,
            onDateTimeChanged: onDateTimeChanged,
          ),
        ),
      ),
    );
  }
}
