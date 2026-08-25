import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthencticationProvider {
  final auth = FirebaseAuth.instance;
  BuildContext context;
  String email;
  String password;

  String get _email => email;

  String get _password => password;

  Future<bool> signUp() async {
    '''
this basically function basically creates account for you in that firm 
''';
    try {
      var userlogs = await auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      print(
        'this user logs: $userlogs, email: $_email, | password: $_password',
      );

      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 110,
            left: 12,
            right: 12,
          ),
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.up,
          backgroundColor: const Color(0xFFE02417),
          content: Text(e.toString()),
        ),
      );

      return false;
    }
  }

  Future<bool> signIn() async {
    '''
this function basically signs my exisiting users in firestore collectively
''';

    try {
      var userlogs = await auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      print('this user  got successfully signed in ${userlogs}');

      // auth.userChanges()
      //TODO: user changes for screens for auth screens

      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xffE02417),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 110,
            right: 12,
            left: 12,
          ),
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.up,
          content: Text(e.toString()),
        ),
      );

      return false;
      // print('error:${e.toString()}');
    }
  }

  Future<void> signOut() async {
    '''
this function basically sign out a user from the unique id from the cache

''';

    try {
      var userlogs = await auth.signOut();

      print('successfully signed this user out');
    } catch (e) {
      print('error:${e.toString()}');
    }
  }

  AuthencticationProvider({
    required this.context,

    this.email = 'lmafo@gmail.com',
    this.password = '123456',
  });
}
