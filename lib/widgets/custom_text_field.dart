import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final double? width;
  final double? height;
  final String title;
  final String hint;
  final ValueChanged<String>? onChange;
  final Widget? suffixIcon;
  final int? maxLines;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.title,
    this.width,
    this.height,
    this.onChange,
    this.suffixIcon,
    this.maxLines,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Container(
            height: widget.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextField(
              onChanged: widget.onChange,
              maxLines: widget.maxLines,
              clipBehavior: Clip.hardEdge,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 12, right: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hint: Text(
                  widget.hint,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.withAlpha(180),
                  ),
                ),
                suffixIcon: widget.suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
