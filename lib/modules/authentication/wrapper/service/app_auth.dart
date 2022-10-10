import '../../../../providers/api_provider.dart';
import '../../../../resource/token_manager.dart';
import '../auth_credential/auth_credential.dart';
import '../models/login.dart';
import '../models/login_data.dart';

class AppAuth {
  final _apiProvider = ApiProvider();

  Future<LoginData?> signInWithCredential(AuthCredential credential) async {
    final login = await _signIn(credential);
    if (login == null) {
      return null;
    }
    await saveData(login.data!);
    return login.data;
  }

  Future<void> saveData(LoginData login) async {
    final tm = TokenManager()..accessToken = login.accessToken ?? '';
    tm.save();
  }

  /// Signs in with the given [credential].
  Future<Login?> _signIn(AuthCredential credential) async {
    try {
      final response = await _apiProvider.post(
        credential.url,
        data: credential.asMap(),
      );
      if (response.statusCode == 200) {
        return Login.fromJSON(response.data);
      }
      return null;
    } catch (e) {
      throw UnimplementedError(
        'signInWithCredential() is not implemented with err = $e',
      );
    }
  }

  /// Signs in with the given [credential].
  Future<Login?> _signUp(AuthCredential credential) async {}
}
