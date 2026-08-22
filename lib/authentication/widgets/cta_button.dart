import 'package:flutter/material.dart';

class CtaBtn extends StatefulWidget {
  CtaBtn({super.key, required this.label, required this.ontap});
  final String label;
  final VoidCallback ontap;

  @override
  State<CtaBtn> createState() => _CtaBtnState();
}

class _CtaBtnState extends State<CtaBtn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
        onPressed: widget.ontap,

        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        // : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
