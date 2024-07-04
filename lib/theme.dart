import 'package:flutter/material.dart';

const Color kWhite = Color(0xffefeaea);
const Color kBlack = Color(0xff090909);
const Color kWhite2 = Color(0xffefeaea);
const Color kBlack2 = Color(0xff241f18);
const Color kLightGrey = Color(0xff2a261f);
const Color kDarkGrey = Color(0xFF9B9B9B);
const Color kGreen = Color(0xff0d988c);
const Color kGreen2 = Color(0xff0d988c);
const Color kDarkBlue = Color(0xff1c153e);
const Color kLightPurple = Color(0xff6352c5);
const Color kDarkPurple = Color(0xff6352c5);

class ThemeClass {
  static ThemeData lightmode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: kGreen,
    ),
  );
  static ThemeData darkmode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: kDarkPurple,
    ),
  );
}

ThemeClass _themeClass = ThemeClass();
