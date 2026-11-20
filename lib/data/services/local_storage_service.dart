import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _keyUsername = 'user_display_name';
  static const String _keyUserId = 'user_firestore_id';

  /// Generates a standardized user ID using display name and symbols (e.g. 'user_miracle_a1b2c3' or 'user_miracle_001')
  static String formatUserId(String displayName, {String? uid}) {
    final clean = displayName
        .trim()
        .toLowerCase()
        .replaceAll(RegExp(r'\s+'), '_')
        .replaceAll(RegExp(r'[^a-z0-9_]'), '');
    final namePart = clean.isNotEmpty ? clean : 'user';

    String suffix;
    if (uid != null && uid.isNotEmpty) {
      suffix = uid.length > 6 ? uid.substring(0, 6) : uid;
    } else {
      suffix = '001';
    }

    return 'user_${namePart}_$suffix';
  }

  /// Save username and update associated user ID locally
  static Future<void> saveUsername(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final trimmed = name.trim();
    await prefs.setString(_keyUsername, trimmed);

    String? uid;
    try {
      uid = FirebaseAuth.instance.currentUser?.uid;
    } catch (_) {}

    final newUserId = formatUserId(trimmed, uid: uid);
    await prefs.setString(_keyUserId, newUserId);
  }

  /// Save explicit user ID locally
  static Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserId, userId.trim());
  }

  /// Get locally saved username:
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
        await saveUsername(name);
        return name;
      }

      // Fall back to email prefix if signed in
      if (currentUser?.email != null && currentUser!.email!.isNotEmpty) {
        final prefix = currentUser.email!.split('@')[0];
        await saveUsername(prefix);
        return prefix;
      }
    } catch (_) {
      // Firebase not initialized or running in test/offline environment
    }

    return null;
  }

  /// Get the current user ID for Firestore operations
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final savedId = prefs.getString(_keyUserId);
    if (savedId != null && savedId.isNotEmpty) {
      return savedId;
    }

    final name = await getUsername() ?? 'user';
    String? uid;
    try {
      uid = FirebaseAuth.instance.currentUser?.uid;
    } catch (_) {}

    final generatedId = formatUserId(name, uid: uid);
    await prefs.setString(_keyUserId, generatedId);
    return generatedId;
  }

  /// Clear saved user data
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUsername);
    await prefs.remove(_keyUserId);
  }
}
