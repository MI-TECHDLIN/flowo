import 'package:flutter/material.dart';

class reusable_avatar extends StatelessWidget {
  reusable_avatar({required this.color});
  int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9999),
        color: Color(color),
      ),
    );
  }
}
