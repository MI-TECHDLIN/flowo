import 'package:flutter/material.dart';

import 'package:flowo/constants/constant.dart';

enum priority { low, medium, high, state }

class TaskPriority extends StatelessWidget {
  TaskPriority({
    required this.label,
    required this.backgroundcolor,
    required this.bordercolor,
    required this.pointercolor,
    required this.enu,
    required this.select,
    required this.ontap,
  });
  int bordercolor;
  int backgroundcolor;
  int pointercolor;
  String label;
  priority enu;
  priority select;
  VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    final selected = enu == select;
    return GestureDetector(
      onTap: ontap,

      child: Container(
        height: 40,
        width: 106,
        decoration: BoxDecoration(
          border: Border.all(
            color: selected
                ? prioritybordercolor(bordercolor)
                : prioritybordercolor(0x35C913D0),
          ),
          color: selected
              ? prioritybackgroundcolor(backgroundcolor)
              : prioritybackgroundcolor(0x44DCECFF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: prioritypointercolor(pointercolor),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selected ? Colors.black : Color(pointercolor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
