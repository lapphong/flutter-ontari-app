import 'package:ontari_app/modules/authentication/wrapper/models/login_data.dart';

import 'auth_plugin.dart';

class AuthEmailAndPassword implements AuthLogin {
  //static final AuthEmailAndPassword _instance = AuthEmailAndPassword.internal();
  final LoginData? data;

  // factory AuthEmailAndPassword(this.data) {
  //   return _instance;
  // }
  AuthEmailAndPassword({this.data});

  @override
  AuthEmailAndPassword.internal(this.data);

  @override
  Future<bool> isLoggedIn() async {
    return data != null ? true : false;
  }

  @override
  Future<AuthResult> login() async {
    try {
      if (data == null) {
        return AuthResult(LoginStatus.cancelledByUser, null);
      }
      return AuthResult(
        LoginStatus.loggedIn,
        data!.accessToken,
      );
    } catch (e) {
      return AuthResult(LoginStatus.error, null);
    }
  }

  @override
  Future<void> logout() async {}
}
