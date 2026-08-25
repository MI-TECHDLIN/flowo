import 'package:flutter/material.dart';

class reusable_avatar extends StatelessWidget {
  reusable_avatar({required this.color, required this.ontouch});
  int color;
  VoidCallback ontouch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontouch,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9999),
          color: Color(color),
        ),
      ),
    );
  }
}
