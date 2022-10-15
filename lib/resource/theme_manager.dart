import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._internal();
  factory ThemeManager() => _instance;
  ThemeManager._internal();

  Future<void> saveTheme(bool themeName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('theme_mode', themeName);
  }

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('theme_mode') ?? true;
  }
}