import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._internal();
  factory ThemeManager() => _instance;
  ThemeManager._internal();

  Future<void> saveTheme(int themeName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', themeName);
  }

  Future<int> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('theme_mode') ?? 0;
  }
}