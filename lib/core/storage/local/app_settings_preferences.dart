import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/constants.dart';

class AppSettingsPreferences {
  static final AppSettingsPreferences _instance =
      AppSettingsPreferences._internal();
  late SharedPreferences _sharedPreferences;

  AppSettingsPreferences._internal();

  factory AppSettingsPreferences() {
    return _instance;
  }

  clear() {
    _sharedPreferences.clear();
  }

  // AppSettingsPreferences(this._sharedPreferences);

  Future<void> setAppTheme(String theme) async {
    await _sharedPreferences.setString(Constants.prefKeyTheme, theme);
  }

  String getAppTheme() {
    return _sharedPreferences.getString(Constants.prefKeyTheme).toString();
  }
}
