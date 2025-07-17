import 'package:flutter/material.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/widgets/category_button.dart';
import 'package:todo_app/widgets/custom_text_field.dart';
import 'package:todo_app/widgets/svg_image.dart';

import '../widgets/add_new_task_screen_header.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              AddNewTaskScreenHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    Column(
                      spacing: 24,
                      children: [
                        CustomTextField(
                          hint: "Task Title",
                          title: "Task Title",
                          maxLines: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 24,
                          children: [
                            Text(
                              "Category",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              spacing: 16,
                              children: [
                                CategoryButton(category: Category.task),
                                CategoryButton(category: Category.event),
                                CategoryButton(category: Category.goal),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            CustomTextField(
                              hint: "Date",
                              title: "Date",
                              width: 175,
                              suffixIcon: IconButton(
                                onPressed: () {},
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
                              width: 175,
                              suffixIcon: IconButton(
                                onPressed: () {},
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
                        CustomTextField(hint: "Notes", title: "Notes", height: 177),
                      ],
                    ),

                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Color(0xff4A3780)),
                    ),
                    child: Text(
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
            ],
          ),
        ),
      ),
    );
  }
}
