import 'package:flutter/material.dart';

class resuablebutton extends StatelessWidget {
  resuablebutton({
    required this.function,
    required this.bgcolor,
    required this.textcolor,
    required this.iconcolor,
    required this.icondata,
    required this.label,
  });
  final int bgcolor;
  final int textcolor;
  final IconData icondata;
  final int iconcolor;
  final String label;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 140,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color(bgcolor)),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icondata, size: 20, color: Color(iconcolor)),
            SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: Color(textcolor),
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
