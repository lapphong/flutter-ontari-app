import 'auth_credential.dart';

/// An [AuthCredential] for authenticating via gmail.com.
class GmailAuthCredential extends AuthCredential {
  const GmailAuthCredential({this.accessToken}) : super(_url);

  static const String _url = '/auth/gmail';

  @override
  Map<String, String?> asMap() {
    return {'gmail_token': accessToken};
  }

  /// The Gmail access token.
  final String? accessToken;
}
