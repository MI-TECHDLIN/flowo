import 'package:flutter/material.dart';

class TaskCount extends StatelessWidget {
  final Color bgcolor;
  final String ktext;
  final String ptext;
  final Color tcolor;

  const TaskCount(this.bgcolor, this.ktext, this.ptext, this.tcolor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 111.67,
      height: 79,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: bgcolor,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ktext, style: TextStyle(fontSize: 24, color: tcolor)),
            SizedBox(width: 13),
            Text(
              ptext,
              style: TextStyle(fontSize: 14, color: Color(0xFF6C84A0)),
            ),
          ],
        ),
      ),
    );
  }
}
