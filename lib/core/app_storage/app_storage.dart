import 'package:get_storage/get_storage.dart';

class AppStorage {
  static final GetStorage _box = GetStorage();

  /// Keys
  static const String keyToken = 'token';
  static const String keyLocale = 'locale';
  static const String keyTheme = 'theme';
  static const String keyUser = 'user';

  /// Initialization
  static Future<void> init() async {
    await GetStorage.init();
  }

  /// ==============================
  /// Generic Methods
  /// ==============================

  static Future<void> setString(String key, String value) async {
    await _box.write(key, value);
  }

  static String? getString(String key) {
    return _box.read<String>(key);
  }

  static Future<void> setBool(String key, bool value) async {
    await _box.write(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _box.read<bool>(key) ?? defaultValue;
  }

  static Future<void> setInt(String key, int value) async {
    await _box.write(key, value);
  }

  static int getInt(String key, {int defaultValue = 0}) {
    return _box.read<int>(key) ?? defaultValue;
  }

  static Future<void> setDouble(String key, double value) async {
    await _box.write(key, value);
  }

  static double getDouble(String key, {double defaultValue = 0.0}) {
    return _box.read<double>(key) ?? defaultValue;
  }

  static Future<void> remove(String key) async {
    await _box.remove(key);
  }

  static Future<void> clear() async {
    await _box.erase();
  }

  /// ==============================
  /// Custom Helpers
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