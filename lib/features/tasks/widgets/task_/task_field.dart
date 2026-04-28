import 'package:flutter/material.dart';

class TaskField extends StatelessWidget {
  TaskField({
    required this.controller,
    required this.text,

    this.vertical = 20,
    this.horizontal = 0,
  });

  final TextEditingController? controller;
  String? text;
  double vertical;
  double horizontal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text!, style: TextStyle(fontSize: 14)),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: vertical,
              horizontal: horizontal,
            ),
            // isCollapsed: ,
            fillColor: Colors.white,
            focusColor: Colors.blueAccent,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),

              borderSide: BorderSide(color: Color(0xFF8E32F0)),
            ),

            enabled: true,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xffC89FF5)),
            ),
            hintText: 'e.g. Finish the weekly report 📋',
            hintStyle: TextStyle(fontWeight: FontWeight.w200),
            filled: true,
          ),
        ),
      ],
    );
  }
}
