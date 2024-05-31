import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final _googleSignIn = GoogleSignIn(
    clientId:
        "555473141886-6dh9gp55cdr6s41ol5op2ls63v5mudbd.apps.googleusercontent.com",
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  static Future<GoogleSignInAccount?> handleSignIn() async {
    try {
      final user = await _googleSignIn.signIn();
      print(user!.email);
    } catch (error) {
      print(error);
      return null;
    }
  }

  // static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future logout() => _googleSignIn.disconnect();
}
