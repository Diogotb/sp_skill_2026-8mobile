import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryLight = Color(0xFF3F51B5);
  static const Color secondaryLight = Color(0xFF00ACC1);
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color widgetBackgroundLight = Color(0xFFFFFFFF);
  static const Color textLight = Color(0xFF212121);
  static const Color successLight = Color(0xFFFFC107);
  static const Color errorLight = Color(0xFFF44336);

  static const Color primaryDark = Color(0xFF9C27B0);
  static const Color secondaryDark = Color(0xFF00E5FF);
  static const Color textDark = Color(0xFFFAFAFA);
  static const Color widgetBackgroundDark = Color(0xFF1E1E1E);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color successDark = Color(0xFFFFEB3B);
  static const Color errorDark = Color(0xFFFF1744);

  static const Color accentDark = Color(0XFF800020);
  static const Color accentLight = Color(0xFF993344);

  static ColorScheme getColorScheme(bool isDark) {
    return isDark
        ? const ColorScheme.dark(
      primary: primaryDark,
      secondary: secondaryDark,
      surface: backgroundDark,
      primaryContainer: widgetBackgroundDark,
      onPrimary: textDark,
      onError: errorDark,
      error: errorDark,
      onPrimaryContainer: textDark,
      onSurface: textDark,
    )
        : const ColorScheme.light(
      primary: primaryLight,
      secondary: secondaryLight,
      surface: backgroundLight,
      primaryContainer: widgetBackgroundLight,
      onPrimary: textLight,
      onError: errorLight,
      error: errorLight,
      onPrimaryContainer: textLight,
      onSurface: textLight,
    );
  }
}