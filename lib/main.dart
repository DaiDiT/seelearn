import 'package:flutter/material.dart';
import 'screens/landing_screen.dart';

void main() {
  runApp(SeeLearnApp());
}

class SeeLearnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Landing Screen",
      home: LandingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
