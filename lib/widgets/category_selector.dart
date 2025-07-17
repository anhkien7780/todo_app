import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../view_models/add_new_task_view_model.dart';
import 'category_button.dart';

class CategorySelector extends StatefulWidget {
  final Category? selectedCategory;
  const CategorySelector({super.key, this.selectedCategory});
  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  late Category selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.selectedCategory ?? Category.task;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 24,
      children: [
        const Text(
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
            CategoryButton(
              category: Category.task,
              onPressed: () {
                context.read<AddNewTaskViewModel>().updateCategory(Category.task);
                setState(() {
                  selectedCategory = Category.task;
                });
              },
              isSelected: selectedCategory == Category.task,
            ),
            CategoryButton(
              category: Category.event,
              onPressed: () {
                context.read<AddNewTaskViewModel>().updateCategory(Category.event);
                setState(() {
                  selectedCategory = Category.event;
                });
              },
              isSelected: selectedCategory == Category.event,
            ),
            CategoryButton(
              category: Category.goal,
              onPressed: () {
                context.read<AddNewTaskViewModel>().updateCategory(Category.goal);
                setState(() {
                  selectedCategory = Category.goal;
                });
              },
              isSelected: selectedCategory == Category.goal,
            ),
          ],
        ),
      ],
    );
  }
}