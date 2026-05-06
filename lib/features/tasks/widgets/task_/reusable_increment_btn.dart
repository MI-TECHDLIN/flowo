// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ReusableIncrementBtn extends StatelessWidget {
  ReusableIncrementBtn({required this.icon, required this.callback});
  IconData icon;
  VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        height: 25,
        width: 25,

        child: Icon(icon, size: 20),
      ),
    );
  }
}
