import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

class AuthencticationProvider {
  final auth = FirebaseAuth.instance;
  final String email;
  final String password;

  String get _email => email;
  String get _password => password;

  Future<void> createAccount() async {
    '''
this basically function basically creates account for you in that firm 
''';
    try {
      var response = await auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      print(
        'this user logs: $response, email: $_email, | password: $_password',
      );
    } catch (e) {
      return print('catched error: ${e.toString()}');
    }
  }

  void getuser() {
    '''
this function is too create user
''';
  }

  void login() {
    '''
this function basically creates users in the dbs 
''';

    var userlogs = auth.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    );
  }

  AuthencticationProvider({required this.email, required this.password});
}
