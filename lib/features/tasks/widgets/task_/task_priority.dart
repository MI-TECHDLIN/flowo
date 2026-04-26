import 'package:flutter/material.dart';

import 'package:flowo/constants/constant.dart';

class TaskPriority extends StatefulWidget {
  TaskPriority({
    required this.label,
    required this.backgroundcolor,
    required this.bordercolor,
    required this.pointercolor,
  });
  int bordercolor;
  int backgroundcolor;
  int pointercolor;
  String label;

  @override
  State<TaskPriority> createState() => _TaskPriorityState();
}

class _TaskPriorityState extends State<TaskPriority> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        height: 40,
        width: 106,
        decoration: BoxDecoration(
          border: BoxBorder.all(
            color: selected == false
                ? prioritybordercolor(0xB7F5F8FA)
                : prioritybordercolor(0xFFEF4444),
          ),
          color: selected == false
              ? prioritybackgroundcolor(0xAAF5F8FA)
              : prioritybackgroundcolor(0xffFFDCDC),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: prioritypointercolor(0xffEF4444),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(width: 5),
            Text(
              widget.label,
              style: TextStyle(
                color: selected == false
                    ? Colors.black
                    : Color(widget.pointercolor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
