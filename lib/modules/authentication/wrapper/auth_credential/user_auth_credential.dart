import 'auth_credential.dart';

class UserAuthCredential extends AuthCredential {
  UserAuthCredential({this.usrName, this.pwd}) : super(_url);

  static const String _url = '/auth';

  @override
  Map<String, String?> asMap() {
    return {
      'username': usrName,
      'password': pwd,
    };
  }

  final String? usrName;
  final String? pwd;
}
