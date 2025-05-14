import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryLight = Color(0xFF4299E1);
  static const Color backgroundLight = Color(0xFFEFEFEF);
  static const Color widgetBackgroundLight = Color(0xFFDEDEDE);
  static const Color textLight = Color(0xFF2D3748);
  static const Color successLight = Color(0xFF81C784);
  static const Color errorLight = Color(0xFFFC8181);

  static const Color primaryDark = Color(0xFF7C4DFF);
  static const Color textDark = Color(0xFFF5F5F5);
  static const Color widgetBackgroundDark = Color(0xFF2D3748);
  static const Color backgroundDark = Color(0xFF252525);
  static const Color successDark = Color(0xFF66BB6A);
  static const Color errorDark = Color(0xFFEF5350);

  static const Color accent = Color(0xFFBA68C8);

  static ColorScheme getColorScheme(bool isDark) {
    return isDark
        ? const ColorScheme.dark(
          primary: primaryDark,
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
