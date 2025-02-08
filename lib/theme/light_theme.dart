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
    tertiary: Colors.black,
    tertiaryContainer: const Color(0xE6E6E6E6),
    inversePrimary: Colors.grey.shade600,
    inverseSurface: Colors.grey.shade200,
    onInverseSurface: Colors.grey.shade100,
    surfaceContainer: Colors.grey.shade300,
  ),
);
