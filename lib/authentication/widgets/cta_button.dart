import 'package:flutter/material.dart';

class CtaBtn extends StatelessWidget {
  const CtaBtn({
    super.key,
    required this.label,
    required this.ontap,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback ontap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      height: 56,
      width: 285,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Color(0xffC89FF5)),
        ),
        onPressed: isLoading ? null : ontap,
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
