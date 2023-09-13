import 'package:flutter/material.dart';
import 'package:pet_adoption/core/theme/manager_dark_theme_data.dart';
import 'package:pet_adoption/core/theme/manager_light_theme.dart';
import 'package:pet_adoption/route/Routes.dart';
import 'package:get/get.dart';
import 'config/dependency_injection.dart';

void main() async {
  await initModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashView,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: managerLightThemeData(),
      darkTheme: managerDarkThemeData(),
    );
  }
}
