import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowo/authentication/provider/auth_provider.dart';
import 'package:flowo/authentication/sigin_in_screen.dart';
import 'package:flowo/features/profile/widget/avatar_card.dart';
import 'package:flowo/onboarding/onboardingscreen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.all(15),
            child: Text('Save', style: TextStyle(fontWeight: FontWeight.w300)),
          ),
        ],
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            AvatarCard(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('DISPLAY NAME'),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 52,
                  width: 350,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: Color(0xffE5E7EB)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Jordan Davis'),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Text('ACCOUNT'),
                Container(
                  height: 52,
                  width: 350,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Color(0xffE5E7EB)),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Email', style: TextStyle(fontSize: 16)),
                            Text(
                              'jordan@gmail.com',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(
                  height: 52,
                  width: 350,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      side: WidgetStatePropertyAll(
                        BorderSide(color: Color(0xffFCA5A5)),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xffFFFFFF),
                      ),
                    ),
                    onPressed: () async {
                      AuthencticationProvider authstate =
                          AuthencticationProvider(context: context);
                      var auth = await authstate.signOut();

                      auth == true
                          ? Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (c) => SiginInScreen(),
                              ),
                            )
                          : null;
                    },
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 16.5,
                        color: Color(0xffEF4444),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
