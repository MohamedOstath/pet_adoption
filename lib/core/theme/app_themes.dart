import 'package:flutter/material.dart';
import 'package:pet_adoption/core/theme/manager_dark_theme_data.dart';
import 'package:pet_adoption/core/theme/manager_light_theme.dart';

enum AppTheme {
  GreenLight,
  GreenDark,
  BlueLight,
  BlueDark,
  Light,
  Dark
}

final appThemeData = {
  AppTheme.GreenLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
  ),
  AppTheme.GreenDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[700],
  ),
  AppTheme.BlueLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  ),
  AppTheme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
  ),
  AppTheme.Light: managerDarkThemeData(),
  AppTheme.Dark: managerLightThemeData(),
};
