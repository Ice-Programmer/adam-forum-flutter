import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0.0,
    ),
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF1F41BB),
      onPrimary: Colors.white,
      secondary: const Color(0xaFFA8C1D2).withOpacity(0.25),
      tertiary: const Color(0xFFEE4667),
      inversePrimary: Colors.grey.shade600,
      inverseSurface: Colors.black87,
      onInverseSurface: Colors.black26,
      surfaceContainer: Colors.grey.shade300,
    ));
