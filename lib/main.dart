import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/provider/theme_provider.dart';
import 'package:news/core/routes/app_routes.dart';
import 'package:news/core/routes/page_name_route.dart';
import 'package:news/screens/home/home_screen.dart';
import 'package:news/theme/base_theme.dart';
import 'package:news/theme/dark_theme.dart';
import 'package:news/theme/light_theme.dart';
import 'package:provider/provider.dart';
import 'core/cubit/cubit_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme.themeData,
          darkTheme: darkTheme.themeData,
          themeMode: provider.themeMode,
          initialRoute: PageRouteName.initial,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
