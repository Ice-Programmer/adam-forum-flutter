import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0.0,
  ),
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF1F41BB),
    onPrimary: Colors.white,
    secondary: const Color(0xFFF1F4FF),
    tertiary: const Color(0xFFEE4667),
    inversePrimary: Colors.grey.shade600,
    inverseSurface: Colors.grey.shade200,
    onInverseSurface: Colors.grey.shade100,
    surfaceContainer: Colors.grey.shade300,
  ),
);
