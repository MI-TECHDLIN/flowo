import 'package:flutter/material.dart';

class resuablebutton extends StatelessWidget {
  const resuablebutton({super.key, 
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
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(bgcolor),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icondata, size: 18, color: Color(iconcolor)),
            const SizedBox(width: 4),
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
