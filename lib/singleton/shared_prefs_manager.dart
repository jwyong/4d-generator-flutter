import 'package:shared_preferences/shared_preferences.dart';

/// Single instance manager for SharedPrefs - initialise on appStart and access instance from anywhere.
class SharedPreferencesManager {
  late SharedPreferences _sharedPrefs;

  SharedPreferencesManager._privateConstructor();

  static final SharedPreferencesManager _instance = SharedPreferencesManager._privateConstructor();

  factory SharedPreferencesManager() {
    return _instance;
  }

  Future<void> initialize() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get sharedPrefs => _sharedPrefs;
}