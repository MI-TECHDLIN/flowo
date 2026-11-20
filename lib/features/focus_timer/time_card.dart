import 'package:flutter/material.dart';

Widget timewidget(String time, String label, int bgcolor, int color) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        alignment: Alignment.center,
        height: 86,
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(bgcolor),
        ),
        child: Text(
          time,
          style: TextStyle(
            fontSize: 52,
            color: Color(color),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 6),
      Text(
        label,
        style: const TextStyle(
          color: Color(0xff6B7C8F),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
