import 'auth_credential.dart';

/// An [AuthCredential] for authenticating via gmail.com.
class FacebookAuthCredential extends AuthCredential {
  const FacebookAuthCredential({this.accessToken}) : super(_url);

  static const String _url = '/auth/fb';

  @override
  Map<String, String?> asMap() {
    return {'fb_token': accessToken};
  }

  /// The Gmail access token.
  final String? accessToken;
}
