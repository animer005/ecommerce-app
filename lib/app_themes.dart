import 'package:flutter/material.dart';

abstract class AppTheme {
  static const primary = Color(0xFF0F172A);
  static const secondary = Color(0xFF10B981);
  static const background = Color(0xFFF8FAFC);

  static ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: secondary,
        onSurface: primary,
        onPrimary: Colors.white,
        onSecondary: Colors.white
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
  );
}