import 'package:flutter/material.dart';

class SiginInScreen extends StatelessWidget {
  const SiginInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            ],
          ),
        ),
      ),
    );
  }
}
