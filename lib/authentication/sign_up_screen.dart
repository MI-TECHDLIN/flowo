import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowo/authentication/provider/auth_provider.dart';
import 'package:flowo/authentication/sigin_in_screen.dart';
import 'package:flowo/authentication/widgets/cta_button.dart';
import 'package:flowo/authentication/widgets/ctasub_button.dart';
import 'package:flowo/authentication/widgets/textfield_card.dart';
import 'package:flowo/data/services/local_storage_service.dart';
import 'package:flowo/features/tasks/screens/task_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController namestr = TextEditingController();
  final TextEditingController emailstr = TextEditingController();
  final TextEditingController passwordstr = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    namestr.dispose();
    emailstr.dispose();
    passwordstr.dispose();
    super.dispose();
  }

  Future<void> _signup(
    String name,
    String email,
    String password,
  ) async {
    setState(() {
      _isLoading = true;
    });

    try {
      AuthencticationProvider datalogs = AuthencticationProvider(
        context: context,
        email: email,
        password: password,
      );

      bool response = await datalogs.signUp();

      if (response == true) {
        final trimmedName = name.trim();
        if (trimmedName.isNotEmpty) {
          await LocalStorageService.saveUsername(trimmedName);
          await FirebaseAuth.instance.currentUser?.updateDisplayName(trimmedName);
        }
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (c) => const Taskscreen()),
          );
        }
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 90,
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('images/app-inlogo.png'),
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        'Flowo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2D3E50),
                        ),
                      ),
                    ],
                  ),
                ),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Text(
                        'Welcome back👋',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff2D3E50),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Text(
                      'Create an account',
                      style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 40),
                  child: Column(
                    children: [
                      reusable_textfield_card(
                        formdata: namestr,
                        textlabel: 'Display Name',
                        texthint: 'Your name',
                        icondata: Icons.person,
                      ),
                      const SizedBox(height: 20),

                      reusable_textfield_card(
                        formdata: emailstr,
                        textlabel: 'Email',
                        texthint: 'you@example.com',
                        icondata: Icons.email,
                      ),
                      const SizedBox(height: 20),

                      reusable_textfield_card(
                        formdata: passwordstr,
                        textlabel: 'Password',
                        texthint: '. . . . . . . . . .',
                        icondata: Icons.lock,
                      ),

                      CtaBtn(
                        label: 'Sign up',
                        isLoading: _isLoading,
                        ontap: () {
                          _signup(
                            namestr.text,
                            emailstr.text,
                            passwordstr.text,
                          );
                        },
                      ),

                      CtaSubBtn(
                        label: 'have an account?',
                        actionlabel: 'Sign in',
                        ontap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (c) => SiginInScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
