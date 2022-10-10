import 'package:google_sign_in/google_sign_in.dart';

import 'auth_plugin.dart';

class AuthGmail implements AuthLogin {
  static final AuthGmail _instance = AuthGmail.internal();
  late GoogleSignIn _googleSignIn;

  factory AuthGmail() {
    return _instance;
  }

  @override
  AuthGmail.internal() {
    _googleSignIn = GoogleSignIn();
  }

  @override
  Future<bool> isLoggedIn() {
    return _googleSignIn.isSignedIn();
  }

  @override
  Future<AuthResult> login() async {
    await _googleSignIn.signOut(); // force logout
    try {
      final googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        return AuthResult(LoginStatus.cancelledByUser, null);
      }
      final googleSignInAuthentication =
          await googleSignInAccount.authentication;
      return AuthResult(
        LoginStatus.loggedIn,
        googleSignInAuthentication.accessToken,
      );
    } catch (e) {
      return AuthResult(LoginStatus.error, null);
    }
  }

  @override
  Future<void> logout() {
    return _googleSignIn.signOut();
  }
}
