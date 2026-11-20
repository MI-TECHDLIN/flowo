import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _keyUsername = 'user_display_name';

  /// Save username locally in SharedPreferences
  static Future<void> saveUsername(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, name.trim());
  }

  /// Get the user's display name:
  /// 1. Reads from local storage (if previously saved)
  /// 2. If not found locally, checks the logged-in user's Firebase Auth displayName and caches it locally
  /// 3. If neither exists, falls back to the username part of the user's email
  /// Returns null if no user display name is found
  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString(_keyUsername);
    if (savedName != null && savedName.trim().isNotEmpty) {
      return savedName.trim();
    }

    // Check Firebase Auth currentUser.displayName if Firebase is initialized
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser?.displayName != null && currentUser!.displayName!.trim().isNotEmpty) {
        final name = currentUser.displayName!.trim();
        await prefs.setString(_keyUsername, name);
        return name;
      }

      // Fall back to email prefix if signed in
      if (currentUser?.email != null && currentUser!.email!.isNotEmpty) {
        final prefix = currentUser.email!.split('@')[0];
        return prefix;
      }
    } catch (_) {
      // Firebase not initialized or running in test/offline environment
    }

    return null;
  }

  /// Clear saved user data
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUsername);
  }
}
