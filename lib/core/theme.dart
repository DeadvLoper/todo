import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final TextTheme textTheme = GoogleFonts.abelTextTheme();
  static final TextTheme numberTextTheme = GoogleFonts.acmeTextTheme();

  static final primaryColor = fromHex('#FFBA08');
  static final secondaryColor = fromHex('#23395B');
  static final shadowColor = Colors.grey.withAlpha(70);
  static final surfaceColorLight = Colors.white;

  static final ThemeData theme = ThemeData().copyWith(
    textTheme: textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(120, 48),
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
      ),
    ),
  );
}

Color fromHex(String hex) {
  hex = hex.replaceAll('#', '');
  hex = 'FF$hex';
  return Color(int.parse(hex, radix: 16));
}
