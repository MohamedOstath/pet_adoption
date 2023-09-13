import 'package:flutter/material.dart';
import 'package:pet_adoption/features/pets/presentation/view/home_view.dart';
import 'package:pet_adoption/features/pets/presentation/view/pet_details_view.dart';

import '../config/dependency_injection.dart';
import '../core/resources/manager_strings.dart';
import '../features/splash/presentation/view/splash_view.dart';

class Routes {
  static const splashView = "/";
  static const homeView = "/home_view";
  static const petDetailsView = "/pet_details_view";
}


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.homeView:
        initPets();
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.petDetailsView:
        return MaterialPageRoute(builder: (_) => const PetDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  // If PushNamed Failed Return This Page With No Actions
  // This Screen Will Tell The User This Page Is Not Exist
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) =>
          Scaffold(
            appBar: AppBar(
              title: Text(ManagerStrings.noRouteFound),
            ),
            body: Center(
              child: Text(ManagerStrings.noRouteFound),
            ),
          ),
    );
  }
}
