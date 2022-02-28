import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoAppTheme {
// 1
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.lato(
      fontSize: 13.0,
      fontWeight: FontWeight.w700,
      color: Colors.grey,
    ),
    bodyText2: GoogleFonts.lato(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.grey,
    ),
    headline1: GoogleFonts.lato(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.lato(
      fontSize: 17.0,
      fontWeight: FontWeight.w900,
      color: Colors.black,
    ),
    headline3: GoogleFonts.lato(
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline6: GoogleFonts.lato(
      fontSize: 24.0,
      fontWeight: FontWeight.w900,
      color: Colors.black87,
    ),
  );
// 2
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.lato(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline1: GoogleFonts.lato(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.lato(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.lato(
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline6: GoogleFonts.lato(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.black;
        }),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: kScafoldBackgroundColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: darkTextTheme,
    );
  }
}
