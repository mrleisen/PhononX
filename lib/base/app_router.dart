
import 'package:flutter/material.dart';

import '../pesentation/home/home_page.dart';


class AppRouter {

  static const initialRoute = HomePage.routName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routeBuilder;

    switch (settings.name) {

      case HomePage.routName:
        routeBuilder = (BuildContext context) => const HomePage();

      default:
        routeBuilder = (BuildContext context) => const HomePage();
    }

    return MaterialPageRoute(
      builder: routeBuilder,
      settings: settings,
    );
  }

}