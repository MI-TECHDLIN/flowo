import 'package:flutter/material.dart';

class CtaBtn extends StatelessWidget {
  const CtaBtn({required this.label, required this.ontap});

  final String label;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      height: 56,
      width: 285,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Color(0xffC89FF5)),
        ),
        onPressed: ontap,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
