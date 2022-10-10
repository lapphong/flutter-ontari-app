import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static final TokenManager _instance = TokenManager._internal();

  String? accessToken = '';

  factory TokenManager() => _instance;

  TokenManager._internal();

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken!);
  }

  load(SharedPreferences pref) async {
    accessToken = pref.getString('access_token') ?? '';
  }
}
