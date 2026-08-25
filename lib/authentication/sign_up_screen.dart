import 'package:flowo/authentication/provider/auth_provider.dart';
import 'package:flowo/authentication/sigin_in_screen.dart';
import 'package:flowo/authentication/widgets/cta_button.dart';
import 'package:flowo/authentication/widgets/ctasub_button.dart';
import 'package:flowo/authentication/widgets/textfield_card.dart';
import 'package:flowo/features/tasks/screens/task_screen.dart';
import 'package:flutter/material.dart';

//TODO: modified functionalitit for auth class

//TODO: work on state functionality for cta button and signpscreen
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  //variables

  TextEditingController emailstr = TextEditingController();
  TextEditingController passwordstr = TextEditingController();

  ///functions
  Future<void> _signup(BuildContext ctx, String email, String password) async {
    '''
private function triggered by AuthenticationProvider class to create account
''';

    AuthencticationProvider datalogs = AuthencticationProvider(
      context: ctx,
      email: email,
      password: password,
    );

    bool response = await datalogs.signUp();

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
                      'Create an account',
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
                        label: 'Sign up',
                        ontap: () {
                          _signup(context, emailstr.text, passwordstr.text);
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
