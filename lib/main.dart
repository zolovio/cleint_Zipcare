import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/features/auth/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZipCare',
      theme: ThemeData(
        primarySwatch: colorPrimarySwatch,
      ),
      home: const SplashScreen(),
    );
  }
}
