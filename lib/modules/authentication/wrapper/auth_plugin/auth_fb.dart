import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import 'auth_plugin.dart';

class AuthFacebook implements AuthLogin {
  static final AuthFacebook _instance = AuthFacebook.internal();
  late FacebookLogin _fbSignIn;

  factory AuthFacebook() {
    return _instance;
  }

  @override
  AuthFacebook.internal() {
    _fbSignIn = FacebookLogin();
  }

  @override
  Future<bool> isLoggedIn() {
    return _fbSignIn.isLoggedIn;
  }

  @override
  Future<AuthResult> login() async {
    await _fbSignIn.logOut();
    try {
      final fbSignInAccount = await _fbSignIn.logIn(permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ]);
      if (fbSignInAccount == null) {
        return AuthResult(LoginStatus.cancelledByUser, null);
      }
      return AuthResult(
        LoginStatus.loggedIn,
        fbSignInAccount.accessToken?.token,
      );
    } catch (e) {
      return AuthResult(LoginStatus.error, null);
    }
  }

  @override
  Future<void> logout() {
    return _fbSignIn.logOut();
  }
}
