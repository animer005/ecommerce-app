import 'package:flutter/material.dart';

abstract class AppTheme {
  static const primary = Color(0xFF0F172A);
  static const secondary = Color(0xFF10B981);
  static const background = Color(0xFF0B1120);

  static ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: secondary,
      onSurface: secondary,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondary,
        foregroundColor: Colors.white,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondary,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Colors.white54),
      labelStyle: const TextStyle(color: Colors.white70),
      floatingLabelStyle: const TextStyle(color: secondary),
      iconColor: Colors.white70,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: secondary),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: secondary, // Bright green cursor
      selectionColor: Color(0x6610B981), // 40% opacity green highlight
      selectionHandleColor: secondary, // Handle teardrop color
    ),
  );
}
