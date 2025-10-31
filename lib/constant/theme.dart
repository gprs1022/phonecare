
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: AppColor.primaryColor,
    secondary: Colors.white,
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
  appBarTheme: AppBarTheme(
      color: AppColor.primaryColor
  ),
  primaryColor: AppColor.primaryColor,
  secondaryHeaderColor: Colors.white,
  useMaterial3: true,
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColor.primaryColor,
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
    ),
  )
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: AppColor.primaryColor,
    secondary: Colors.black,
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
  appBarTheme: AppBarTheme(
      color: AppColor.primaryColor
  ),
  primaryColor: AppColor.primaryColor,
  secondaryHeaderColor: Colors.white,
  useMaterial3: true,
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColor.primaryColor,
    ),
  ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
    )
);
