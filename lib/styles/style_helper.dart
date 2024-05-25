import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleHelper {
  static TextStyle getHebrewNoto(TextTheme theme) {
    return GoogleFonts.notoSansHebrew(
        textStyle: theme.titleLarge!.copyWith(fontSize: 500, fontWeight: FontWeight.w700));
  }
}
