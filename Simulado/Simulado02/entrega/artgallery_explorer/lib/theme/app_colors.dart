import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryLight = Color(0xFF4A4A4A);
  static const Color secondaryLight = Color(0xFFC0A062);
  static const Color backgroundLight = Color(0xFFFDFBF6);
  static const Color widgetBackgroundLight = Color(0xFF4A4A4A);
  static const Color textLight = Color(0xFF333333);
  static const Color successLight = Color(0xFF81C784);
  static const Color errorLight = Color(0xFFFC8181);

  static const Color primaryDark = Color(0xFF2F2F2F);
  static const Color secondaryDark = Color(0xFFCBA96D);
  static const Color textDark = Color(0xFFE0E0E0);
  static const Color widgetBackgroundDark = Color(0xFF2F2F2F);
  static const Color backgroundDark = Color(0xFF252525);
  static const Color successDark = Color(0xFF66BB6A);
  static const Color errorDark = Color(0xFFEF5350);

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