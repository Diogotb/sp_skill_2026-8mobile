import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF00A878);
  static const secondary = Color(0xFF4059AD);
  static const accent = Color(0xFFD90368);
  static const backgroundLight = Color(0xFFF7F7F7);
  static const backgroundDark = Color(0xFF121212);
  static const textLight = Color(0xFF222222);
  static const textDark = Color(0xFFEFEFEF);

  static ColorScheme getScheme({bool isDark = false}) {
    return ColorScheme(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primary: primary,
      onPrimary: isDark ? Colors.black : Colors.white,
      secondary: secondary,
      onSecondary: isDark ? Colors.black : Colors.white,
      error: accent,
      onError: isDark ? Colors.black : Colors.white,
      surface: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      onSurface: isDark ? textDark : textLight,
    );
  }
}
