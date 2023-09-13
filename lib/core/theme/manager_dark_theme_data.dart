import 'package:flutter/material.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_font_size.dart';
import '../resources/manager_fonts.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
    // TODO: CHECK THIS
    useMaterial3: true,

    /// main color of the app
    primaryColor: ManagerColors.black,
    primaryColorLight: ManagerColors.primaryColorLight,
    primaryColorDark: ManagerColors.primaryColorDark,

    // this for disabled button color
    // disabledColor: ManagerColors.textColor,

    splashColor: ManagerColors.greyLight,
    backgroundColor: ManagerColors.background,
    scaffoldBackgroundColor: ManagerColors.backgroundDark,

    /// AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ManagerColors.black,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: ManagerColors.white,
        fontSize: ManagerFontSize.s18,
      ),
    ),

    /// Button theme
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: ManagerColors.greyLight,
      buttonColor: ManagerColors.buttonColorDarK,
    ),

    /// Text Theme
    // textTheme: ManagerTextThemeDark(),
  );
}
