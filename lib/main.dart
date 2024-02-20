import 'package:flutter/material.dart';
import 'package:spiralrunner/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Android Club',
      theme: ThemeData(
        primaryColor: const Color(0xFF74B9FF), // Soft blue
        //accentColor: Color(0xFFF5F5F5), // Light grey
        scaffoldBackgroundColor: const Color(0xFFFDFEFE), // Off-white
      ),
      home: const WelcomeScreen(),
    );
  }
}
