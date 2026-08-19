import 'package:flowo/authentication/sigin_in_screen.dart';
import 'package:flowo/authentication/sign_up_screen.dart';
import 'package:flowo/constants/constant.dart';
import 'package:flutter/material.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 70,
            right: 25,
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                'Skip',
                style: TextStyle(color: Color(0xff6B7C8F)),
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: 13,
            child: Image(image: const AssetImage('images/onboard.png')),
          ),
          Positioned(
            left: 100,

            bottom: 340,
            child: SizedBox(
              height: 80,
              width: 200,
              child: const Text(
                'Plan your day, effortlessly',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff2D3E50),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            left: 70,
            bottom: 250,
            child: SizedBox(
              width: 260,
              height: 80,
              child: const Text(
                'Flowo helps you to stay focused and calm one task at a time',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff6B7C8F),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 130,
            left: 45,
            child: Column(
              children: [
                SizedBox(
                  height: 56,
                  width: 335,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xffC89FF5),
                      ),
                    ),
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (c) => SignUpScreen()),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (c) => SiginInScreen()),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 18),
                    child: Text(
                      'I already have an account',
                      style: TextStyle(
                        color: Color(0xFFA250F9),
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
