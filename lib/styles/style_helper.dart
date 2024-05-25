import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleHelper {
  static TextStyle getHebrewNotoAutoSize(TextTheme theme) {
    return GoogleFonts.notoSansHebrew(
        textStyle: theme.titleLarge!.copyWith(
      fontSize: 500,
      fontWeight: FontWeight.w700,
    ));
  }

  static TextStyle getItalicLatin(TextStyle style) {
    return GoogleFonts.notoSerifDisplay(
        textStyle: style.copyWith(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
    ));
  }
}
