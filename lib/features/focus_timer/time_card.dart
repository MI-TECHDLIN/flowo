import 'package:flutter/material.dart';

Widget timewidget(String time, String label, int bgcolor, int color) {
  return Column(
    children: [
      Container(
        alignment: Alignment.center,
        height: 96,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0x82F3E8FF),
        ),

        child: Text(
          time,
          style: TextStyle(
            fontSize: 58,
            color: Color(color),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      SizedBox(height: 4),
      Text(label),
    ],
  );
}
