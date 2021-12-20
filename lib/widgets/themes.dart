import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData get lightTheme => ThemeData(
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: DarkBluishColor,
      accentColor: DarkBluishColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ));

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.black,
      canvasColor: DarkCreamColor,
      buttonColor: LightBluishColor,
      accentColor: Colors.white,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ));

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color DarkCreamColor = Vx.gray900;
  static Color DarkBluishColor = Color(0xff403b58);
  static Color LightBluishColor = Vx.indigo500;
}
