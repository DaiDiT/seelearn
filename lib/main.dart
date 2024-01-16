import 'package:flutter/material.dart';
import 'navigation_menu.dart';
import 'video.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "See Learn",
      home: Video(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: const NavigationMenu(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 128,
      splash: 'lib/assets/images/seelearn_logo.png',
      animationDuration: const Duration(milliseconds: 800),
      duration: 2000,
      curve: Curves.easeInOut,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
