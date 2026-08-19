import 'package:flutter/material.dart';

class CtaSubBtn extends StatelessWidget {
  const CtaSubBtn({
    required this.label,
    required this.actionlabel,
    required this.ontap,
  });
  final String label;
  final String actionlabel;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // color: Colors.blue,
      width: 330,
      margin: EdgeInsets.symmetric(vertical: 150, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.2,
            ),
          ),
          SizedBox(width: 20),

          GestureDetector(
            onTap: ontap,
            child: Text(
              actionlabel,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: Color(0xffC89FF5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
