import '../auth_credential/auth_credential.dart';
import '../auth_credential/fb_auth_credential.dart';
import '../auth_credential/gmail_auth_credential.dart';
import '../auth_credential/user_auth_credential.dart';

class GmailAuthProvider {
  static AuthCredential getCredential({String? accessToken}) {
    return GmailAuthCredential(accessToken: accessToken);
  }
}

class FaceBookAuthProvider {
  static AuthCredential getCredential({String? accessToken}) {
    return FacebookAuthCredential(accessToken: accessToken);
  }
}

// class UserRegisterProvider {
//   static AuthCredential getCredential({UserModel? user}) {
//     return UserAuthRegisterCredential(user: user);
//   }
// }

class UserAuthProvider {
  static AuthCredential getCredential({String? usrName, String? password}) {
    return UserAuthCredential(usrName: usrName, pwd: password);
  }
}
