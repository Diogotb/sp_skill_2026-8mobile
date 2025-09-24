import 'package:flutter/material.dart';

class AppTextStyle{
  static final body = TextStyle(fontSize: 16, fontFamily: "OpenSans");
  static final title = TextStyle(fontSize: 22, fontFamily:  "Montserrat", fontWeight: FontWeight.bold);
  static final caption = TextStyle(fontSize: 14, fontFamily: "OpenSans");

  TextTheme get textTheme => TextTheme(
    bodyLarge: body,
    bodyMedium: body,
    bodySmall: caption,
    titleMedium: title,
    titleLarge: title,
  );
}