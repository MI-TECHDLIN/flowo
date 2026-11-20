import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _keyUsername = 'user_display_name';
  static const String defaultUsername = 'Miracle';

  /// Save username locally
  static Future<void> saveUsername(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, name.trim());
  }

  /// Get locally saved username, falling back to defaultUsername ('Miracle')
  static Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString(_keyUsername);
    if (savedName != null && savedName.trim().isNotEmpty) {
      return savedName.trim();
    }
    return defaultUsername;
  }

  /// Clear saved user data
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUsername);
  }
}
