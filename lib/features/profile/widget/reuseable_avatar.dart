import 'package:flutter/material.dart';

class reusable_avatar extends StatelessWidget {
  reusable_avatar({
    required this.color,
    required this.bordercolor,
    required this.ontouch,
  });
  int color;
  VoidCallback ontouch;
  int bordercolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontouch,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Color(bordercolor), width: 2),
          borderRadius: BorderRadius.circular(9999),
          color: Color(color),
        ),
      ),
    );
  }
}
