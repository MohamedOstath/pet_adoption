import 'package:flutter/material.dart';
import 'package:pet_adoption/core/storage/local/app_settings_preferences.dart';
import '../../config/constants.dart';
import '../theme/manager_dark_theme_data.dart';
import '../theme/manager_light_theme.dart';
import 'package:get/get.dart';

class ThemeService {
  // final AppSettingsPreferences _appSettingsPrefs = AppSettingsPreferences();

  // ThemeService();

  bool isDarkMode() => Get.isDarkMode;

  ThemeMode getThemeMode() => isDarkMode() ? ThemeMode.dark : ThemeMode.light;

  ThemeData getThemeData() =>
      isDarkMode() ? managerDarkThemeData() : managerLightThemeData();
}
