import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final double? width;
  final double? height;
  final String title;
  final String hint;
  final ValueChanged<String>? onChange;
  final Widget? suffix;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.title,
    this.width,
    this.height,
    this.onChange,
    this.suffix,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          TextField(
            onChanged: widget.onChange,
            maxLines: 1,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              hint: Text(
                widget.hint,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.withValues(alpha: 20),
                ),
              ),
              suffix: widget.suffix,
            ),
          ),
        ],
      ),
    );
  }
}
