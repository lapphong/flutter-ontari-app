import 'package:flutter/services.dart';

import '../auth_plugin/auth_email_password.dart';
import '../auth_plugin/auth_fb.dart';
import '../auth_plugin/auth_gmail.dart';
import '../auth_plugin/auth_plugin.dart';
import '../auth_provider/auth_provider.dart';
import '../models/login_data.dart';
import 'app_auth.dart';
import 'auth_service.dart';

class AppAuthService implements AuthService {
  final _appAuth = AppAuth();

  @override
  Future<LoginData?> loginWithGmail() async {
    final authGmail = AuthGmail();
    final authResult = await authGmail.login();
    if (authResult.accessToken != null) {
      print('token gmail : ${authResult.accessToken}');
      final result = await _appAuth.signInWithCredential(
        GmailAuthProvider.getCredential(accessToken: authResult.accessToken),
      );
      return result;
    }
    return handleError(authResult);
  }

  @override
  Future<LoginData?> loginWithFacebook() async {
    final authFacebook = AuthFacebook();
    final authResult = await authFacebook.login();
    if (authResult.accessToken != null) {
      print('token facebook : ${authResult.accessToken}');
      final result = await _appAuth.signInWithCredential(
        FaceBookAuthProvider.getCredential(accessToken: authResult.accessToken),
      );
      return result;
    }
    return handleError(authResult);
  }

  @override
  Future<LoginData?> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final result = await _appAuth.signInWithCredential(
      UserAuthProvider.getCredential(usrName: email, password: password),
    );
    final authEmailAndPassword = AuthEmailAndPassword(data: result);
    final authResult = await authEmailAndPassword.login();

    if (authResult.accessToken != null) {
      print('token email : ${authResult.accessToken}');
      return result;
    }
    return handleError(authResult);
  }

  LoginData handleError(AuthResult authResult) {
    if (authResult.loginStatus == LoginStatus.cancelledByUser) {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
    throw PlatformException(
      code: 'ERROR_BY_CONFIG',
      message: authResult.errMessage,
    );
  }
}
