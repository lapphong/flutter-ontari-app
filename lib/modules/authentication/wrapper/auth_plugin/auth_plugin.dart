enum LoginStatus {
  loggedIn,
  cancelledByUser,
  error,
}

class AuthResult {
  LoginStatus loginStatus;
  String? accessToken;
  String? errMessage;

  AuthResult(this.loginStatus, this.accessToken, {this.errMessage});
}

abstract class AuthLogin {
  AuthLogin.internal();
  Future<AuthResult> login();
  Future<bool> isLoggedIn();
  Future<void> logout();
}
