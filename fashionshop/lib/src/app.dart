import 'package:fashionshop/src/resources/LoginScreen.dart';
import 'package:fashionshop/src/resources/RegisterScreen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFF5BBABB, const <int, Color>{
          50: const Color(0xFF5BBABB),
          100: const Color(0xFF5BBABB),
          200: const Color(0xFF5BBABB),
          300: const Color(0xFF5BBABB),
          400: const Color(0xFF5BBABB),
          500: const Color(0xFF5BBABB),
          600: const Color(0xFF5BBABB),
          700: const Color(0xFF5BBABB),
          800: const Color(0xFF5BBABB),
          900: const Color(0xFF5BBABB),
        }),
      ),
      home: LoginScreen(),
    );
  }
}
