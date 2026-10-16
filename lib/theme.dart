import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF0D9488);
const Color primaryDark = Color(0xFF0F766E);
const Color backgroundColor = Color(0xFFF8FAFC);
const Color textPrimary = Color(0xFF1E293B);
const Color textSecondary = Color(0xFF64748B);

ThemeData appTheme() {
  return ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: primaryDark,
    ),
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    fontFamily: 'Vazirmatn',
  );
}