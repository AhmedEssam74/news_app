import 'package:flutter/material.dart';
import 'package:news/core/routes/page_name_route.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) Navigator.pushReplacementNamed(context, PageRouteName.login);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Center(
              child: Image.asset("assets/images/splashLight.png", width: 200, height: 200),
            ),
          ]
      ),
    );
  }
}

