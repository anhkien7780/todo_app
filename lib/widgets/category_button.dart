import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/models/category.dart';

class CategoryButton extends StatefulWidget {
  final Category category;
  final VoidCallback? onPressed;
  final bool? isSelected;

  const CategoryButton({
    super.key,
    required this.category,
    this.onPressed,
    this.isSelected,
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.onPressed;
      },
      icon: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(shape: BoxShape.circle, color: _buildColor()),
        child: _buildIcon(),
      ),
    );
  }

  Widget _buildIcon() {
    String path;
    switch (widget.category) {
      case Category.task:
        path = "lib/assets/icons/ic_task.svg";
        break;
      case Category.event:
        path = "lib/assets/icons/ic_event.svg";
        break;
      case Category.goal:
        path = "lib/assets/icons/ic_goal.svg";
        break;
    }
    return Center(
      child: SvgPicture.asset(width: 24, height: 24, path, fit: BoxFit.contain),
    );
  }

  Color _buildColor() {
    switch (widget.category) {
      case Category.task:
        return Color(0xffDBECF6);
      case Category.event:
        return Color(0xffE7E2F3);
      case Category.goal:
        return Color(0xffFEF5D3);
    }
  }
}
