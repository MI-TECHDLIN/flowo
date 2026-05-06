import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskField extends StatelessWidget {
  TaskField({
    required this.controller,
    required this.text,
    required this.hinttext,
    this.vertical = 0,
    this.horizontal = 0,
  });

  final TextEditingController? controller;
  String? text;
  String? hinttext;
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
            // contentPadding: EdgeInsets.only(bottom: 60),
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
            hint: Container(
              margin: EdgeInsets.fromLTRB(0, vertical, 0, horizontal),
              child: Text(
                hinttext!,
                style: TextStyle(fontSize: 16, color: Color(0xffC3CDD7)),
              ),
            ),
            hintTextDirection: TextDirection.ltr,

            hintStyle: TextStyle(fontWeight: FontWeight.w200),
            filled: true,
          ),
        ),
      ],
    );
  }
}
