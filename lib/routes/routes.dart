import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowo/features/tasks/screens/task_screen.dart';
import 'package:flowo/onboarding/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Routes extends StatelessWidget {
  Routes({super.key});
  var listener = FirebaseAuth.instance.authStateChanges();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: listener,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) return Taskscreen();

        return Onboardingscreen();
      },
    );
  }
}
