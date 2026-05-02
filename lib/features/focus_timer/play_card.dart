import 'package:flutter/material.dart';

class PlayCard extends StatelessWidget {
  PlayCard(
    this.icon, {
    required this.ontap,
    this.height = 72,
    this.width = 72,
    this.bgcolor = 0xffC89FF5,
    this.iconcolor = 0xffFFFFFFF,
    this.iconsize = 42,
  });
  IconData icon;
  VoidCallback ontap;
  double? height;
  double? width;
  int bgcolor;
  int iconcolor;
  double iconsize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,

      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Color(bgcolor),
          borderRadius: BorderRadius.circular(36),
        ),
        child: Icon(icon, color: Color(iconcolor), size: iconsize),
      ),
    );
  }
}
