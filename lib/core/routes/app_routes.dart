import 'package:flutter/material.dart';
import 'package:news/core/routes/page_name_route.dart';
import 'package:news/screens/home/home_screen.dart';
import 'package:news/screens/splash_page/splash_screen.dart';

abstract class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
        case PageRouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
