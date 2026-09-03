import 'package:flutter/material.dart';

abstract class AppTheme {
  static const primaryDark = Color(0xFF0F172A);
  static const primaryLight = Color(0xFFE2E8F0);

  static const secondaryDark = Color(0xFF10B981);
  static const secondaryLight = Color(0xFF059669);
  static const backgroundDark = Color(0xFF0B1120);
  static const backgroundLight = Color(0xFFF8FAFC);

  static final ValueNotifier<bool> isDarkNotifier = ValueNotifier<bool>(false);

  static bool get isDark => isDarkNotifier.value;
  static set isDark(bool value) => isDarkNotifier.value = value;

  static Color get primary => isDark ? primaryDark : primaryLight;
  static Color get secondary => isDark ? secondaryDark : secondaryLight;
  static Color get background => isDark ? backgroundDark : backgroundLight;
  static Color get onPrimary => isDark ? Colors.white : primaryDark;

  // Text/icon color that reads correctly on `background` in both modes.
  static Color get onBackground => isDark ? Colors.white : primaryDark;
  static Color get hintColor => isDark ? Colors.white54 : primaryDark.withValues(alpha: 0.4);
  static Color get labelColor => isDark ? Colors.white70 : primaryDark.withValues(alpha: 0.7);
  static Color get iconColor => isDark ? Colors.white70 : primaryDark.withValues(alpha: 0.7);
  static Color get borderColor => isDark ? Colors.white.withValues(alpha: 0.2) : primaryDark.withValues(alpha: 0.2);
  static Color get cardColor => isDark ? Colors.white.withValues(alpha: 0.05) : primaryDark.withValues(alpha: 0.03);
  static Color get cardBorderColor => isDark ? Colors.white.withValues(alpha: 0.1) : primaryDark.withValues(alpha: 0.08);

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
      hintStyle: TextStyle(color: hintColor),
      labelStyle: TextStyle(color: labelColor),
      floatingLabelStyle: TextStyle(color: secondary),
      iconColor: iconColor,
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