import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF004831);
  static const secondaryColor = Color(0xFFAFCA31);
  static const neutralColor = Color(0xFF4B4B4B);
  static const lightColor = Color(0xFFF5F5F5);

  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      surface: lightColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
    ),
  );
}
