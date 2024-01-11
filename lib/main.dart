import 'package:flutter/material.dart';
import 'screens/landing_screen.dart';
import 'navigation_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Landing Screen",
      home: NavigationMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}
