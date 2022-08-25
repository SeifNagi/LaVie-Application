import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/pages/first_screen.dart';
import 'package:weather_application/utils/colors/main_used_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          duration: 500,
          splash: Image.asset('assets/images/La Vie logo.png'),
          nextScreen: const firstScreen(),
          splashTransition: SplashTransition.rotationTransition,
          backgroundColor: white),
    );
  }
}
