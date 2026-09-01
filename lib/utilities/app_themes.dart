import 'package:flutter/material.dart';

abstract class AppTheme {
  static const primaryDark = Color(0xFF0F172A);
  // Inverted color of 0xFF0F172A (255 - R, 255 - G, 255 - B)
  static const primaryLight = Color(0xFFF0E8D5);

  static const secondaryDark = Color(0xFF10B981);
  static const secondaryLight = primaryDark;
  static const backgroundDark = Color(0xFF0B1120);
  static const backgroundLight = Color(0xFFF8FAFC);

  static final ValueNotifier<bool> isDarkNotifier = ValueNotifier<bool>(true);

  static bool get isDark => isDarkNotifier.value;
  static set isDark(bool value) => isDarkNotifier.value = value;

  static Color get primary => isDark ? primaryDark : primaryLight;
  static Color get secondary => isDark ? secondaryDark : secondaryLight;
  static Color get background => isDark ? backgroundDark : backgroundLight;
  static Color get onPrimary => isDark ? Colors.white : primaryDark;

  static ThemeData get theme => ThemeData(
    brightness: isDark ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: isDark ? Brightness.dark : Brightness.light,
      primary: primary,
      secondary: secondary,
      onSurface: secondary,
      onPrimary: onPrimary,
      onSecondary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      foregroundColor: onPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondary,
        foregroundColor: Colors.white,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: secondary,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Colors.white54),
      labelStyle: const TextStyle(color: Colors.white70),
      floatingLabelStyle: TextStyle(color: secondary),
      iconColor: Colors.white70,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: secondary),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: secondary,
      selectionColor: secondary.withAlpha(100),
      selectionHandleColor: secondary,
    ),
  );
}