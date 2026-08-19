import 'package:flowo/authentication/sigin_in_screen.dart';
import 'package:flowo/authentication/widgets/cta_button.dart';
import 'package:flowo/authentication/widgets/ctasub_button.dart';
import 'package:flowo/authentication/widgets/textfield_card.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  margin: EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
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

                Column(
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
                      'Sign in to your account',
                      style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 70, vertical: 80),
                  child: Column(
                    children: [
                      textfield_card(
                        textlabel: 'Email',
                        texthint: 'you@example.com',
                        icondata: Icons.email,
                      ),
                      SizedBox(height: 20),

                      textfield_card(
                        textlabel: 'Password',
                        texthint: '. . . . . . . . . .',
                        icondata: Icons.lock,
                      ),

                      CtaBtn(label: 'Sign up', ontap: () {}),

                      CtaSubBtn(
                        label: 'have an account?',
                        actionlabel: 'Sign in',
                        ontap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (c) => SiginInScreen()),
                        ),
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
