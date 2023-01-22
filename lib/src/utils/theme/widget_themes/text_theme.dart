import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sheltr_flutter/src/constants/colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: DarkColor),
    headline2: GoogleFonts.montserrat(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: DarkColor),
    headline3: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: DarkColor),
    headline4: GoogleFonts.poppins(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: DarkColor),
    headline5: GoogleFonts.poppins(
        fontSize: 15.0, fontWeight: FontWeight.w600, color: DarkColor),
    headline6: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: DarkColor),
    bodyText1: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: DarkColor),
    bodyText2: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: DarkColor),
  );
  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: WhiteColor),
    headline2: GoogleFonts.montserrat(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: WhiteColor),
    headline3: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: WhiteColor),
    headline4: GoogleFonts.poppins(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: WhiteColor),
    headline5: GoogleFonts.poppins(
        fontSize: 15.0, fontWeight: FontWeight.w600, color: WhiteColor),
    headline6: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: WhiteColor),
    bodyText1: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: WhiteColor),
    bodyText2: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: WhiteColor),
  );
}
