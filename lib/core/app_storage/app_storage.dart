import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static late SharedPreferences _prefs;

  /// 🔥 Keys (خليهم هنا عشان التنظيم)
  static const String keyToken = 'token';
  static const String keyLocale = 'locale';
  static const String keyTheme = 'theme';
  static const String keyUser = 'user';

  /// ✅ Initialization
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// ==============================
  /// ✅ Generic Methods
  /// ==============================

  static Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  static String? getString(String key) {
    return _prefs.getString(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  static Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  static int getInt(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  static Future<bool> setDouble(String key, double value) async {
    return await _prefs.setDouble(key, value);
  }

  static double getDouble(String key, {double defaultValue = 0.0}) {
    return _prefs.getDouble(key) ?? defaultValue;
  }

  static Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  static Future<bool> clear() async {
    return await _prefs.clear();
  }

  /// ==============================
  /// 🔥 Custom Helpers (الأهم)
  /// ==============================

  /// Token
  static Future<void> saveToken(String token) async {
    await setString(keyToken, token);
  }

  static String? getToken() {
    return getString(keyToken);
  }

  static Future<void> clearToken() async {
    await remove(keyToken);
  }

  /// Locale
  static Future<void> saveLocale(String locale) async {
    await setString(keyLocale, locale);
  }

  static String getLocale() {
    return getString(keyLocale) ?? 'ar';
  }

  /// Theme (light / dark)
  static Future<void> saveTheme(bool isDark) async {
    await setBool(keyTheme, isDark);
  }

  static bool isDarkMode() {
    return getBool(keyTheme);
  }
}
