import 'package:flutter/material.dart';
import 'package:news/core/routes/page_name_route.dart';
import 'package:news/screens/Auth/login.dart';
import 'package:news/screens/Auth/register.dart';
import 'package:news/screens/Search/Search_screen.dart';
import 'package:news/screens/home/home_screen.dart';
import 'package:news/screens/splash_page/splash_screen.dart';

abstract class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case PageRouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case PageRouteName.searchScreen:
        return MaterialPageRoute(builder: (context) => SearchScreen());
      case PageRouteName.register:
        return MaterialPageRoute(builder: (context) => const Register());
      case PageRouteName.login:
        return MaterialPageRoute(builder: (context) => const Login());
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
