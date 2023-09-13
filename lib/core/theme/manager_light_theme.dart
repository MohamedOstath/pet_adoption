import 'package:flutter/material.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_font_size.dart';

ThemeData managerLightThemeData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    /// main color of the app
    primaryColor: ManagerColors.primaryColor,
    primaryColorLight: ManagerColors.primaryColorLight,
    primaryColorDark: ManagerColors.primaryColorDark,
    // disabledColor: ManagerColors.textColor,
    // this for disabled button color
    // splashColor: ManagerColors.greyLight,
    // backgroundColor: ManagerColors.background,
    scaffoldBackgroundColor: ManagerColors.background,

    /// AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ManagerColors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: ManagerColors.primaryColor,
        fontSize: ManagerFontSize.s18,
        fontWeight: FontWeight.w700,
      ),
    ),

    /// Button theme
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: ManagerColors.greyLight,
      buttonColor: ManagerColors.primaryColor,
    ),

    /// Text Theme
    // textTheme: ManagerTextThemeLight(),
  );
}
