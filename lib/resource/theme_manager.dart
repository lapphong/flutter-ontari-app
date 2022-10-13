import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._internal();
  factory ThemeManager() => _instance;
  ThemeManager._internal();

  Future<void> saveTheme(String themeName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode', themeName);
  }

  Future<String> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('theme_mode')!;
    return name;
  }
}
