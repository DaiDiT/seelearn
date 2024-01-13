import 'package:flutter/material.dart';
import 'navigation_menu.dart';
import 'authentication/register_screen.dart';
import 'authentication/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Landing Screen",
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
