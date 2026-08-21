import 'package:firebase_auth/firebase_auth.dart';
//TODO: imporove the UI for error catching in the onboarding screen

class AuthencticationProvider {
  final auth = FirebaseAuth.instance;
  final String email;
  final String password;

  String get _email => email;
  String get _password => password;

  Future<void> signUp() async {
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
    } catch (e) {
      return print('catched error: ${e.toString()}');
    }
  }

  Future<void> signIn() async {
    '''
this function basically signs my exisiting users in firestore collectively
''';

    try {
      var userlogs = await auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      print('this user  got successfully signed in ${userlogs}');
    } catch (e) {
      print('error:${e.toString()}');
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

  AuthencticationProvider({required this.email, required this.password});
}
