import 'package:flowo/authentication/provider/auth_provider.dart';
import 'package:flowo/authentication/sign_up_screen.dart';
import 'package:flowo/authentication/widgets/cta_button.dart';
import 'package:flowo/authentication/widgets/ctasub_button.dart';
import 'package:flowo/authentication/widgets/textfield_card.dart';

import 'package:flowo/features/tasks/screens/task_screen.dart';
import 'package:flutter/material.dart';

class SiginInScreen extends StatelessWidget {
  SiginInScreen({super.key});

  //variables

  TextEditingController emailstr = TextEditingController();
  TextEditingController passwordstr = TextEditingController();

  //functions
  Future<void> signIn(BuildContext ctx, String email, String password) async {
    '''
this function logs a exisiting account to its interface
''';
    AuthencticationProvider datalogs = AuthencticationProvider(
      context: ctx,
      email: email,
      password: password,
    );

    bool response = await datalogs.signIn();

    response == true
        ? Navigator.pushReplacement(
            ctx,
            MaterialPageRoute(builder: (c) => Taskscreen()),
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    reusable_textfield_card(
                      formdata: emailstr,
                      textlabel: 'Email',
                      texthint: 'you@example.com',
                      icondata: Icons.email,
                    ),
                    SizedBox(height: 20),

                    reusable_textfield_card(
                      formdata: passwordstr,
                      textlabel: 'Password',
                      texthint: '. . . . . . . . . .',
                      icondata: Icons.lock,
                    ),

                    CtaBtn(
                      label: 'Sign in',
                      ontap: () =>
                          signIn(context, emailstr.text, passwordstr.text),
                    ),

                    CtaSubBtn(
                      label: 'Don\'t have an account?',
                      actionlabel: 'Sign up',
                      ontap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (c) => SignUpScreen()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
