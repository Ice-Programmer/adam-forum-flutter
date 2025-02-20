import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0.0,
  ),
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFF1F41BB),
    onPrimary: Colors.white,
    secondary: const Color(0xFFF1F4FF),
    tertiary: Colors.white,
    tertiaryContainer: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade600,
    inverseSurface: Colors.black87,
    onInverseSurface: Colors.black26,
    surfaceContainer: Colors.grey.shade900,
    surfaceContainerLowest: Colors.grey.shade800,
    surfaceContainerHighest: Colors.grey.shade700,
  ),
);
