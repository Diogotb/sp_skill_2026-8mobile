import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextThemes {
  static final TextStyle logo = GoogleFonts.orbitron(
    fontSize: 34,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle title = GoogleFonts.rajdhani(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle subtitle = GoogleFonts.rajdhani(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle body = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle caption = GoogleFonts.inter(
    fontSize: 14,
    fontStyle: FontStyle.italic,
  );
}
