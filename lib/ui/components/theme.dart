import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color mainColor = Color(0xffFF2D55);
const Color bodyColor = Color(0xFFFFFFFF);
const Color textDark = Color(0xff080808);
const Color textDark2 = Color(0xff34495E);

const colorWhite =  const Color(0xFFFFFFFF);
const color0 =  const Color(0xFF001121);
const color1 =  const Color(0xFF1e1f28);
const color2 =  const Color(0xFF2c3e50);
const color21 =  const Color(0xFF30323d);
const color22 =  const Color(0xFF2b2d38);
const color3 =  const Color(0xFF262833);
const color5 =  const Color(0xFF36C7D0);
const color51 =  const Color(0xFF57ACDC);
const color52 =  const Color(0xFFE5131E);
const color53 =  const Color(0xFFd7385e);
const color6 =  const Color(0xFFB6C6D5);
const color7 =  const Color(0xFFB0B3B8);


ThemeData mainThemeLight(BuildContext context) {
    return ThemeData(
        brightness: Brightness.light,
        accentColor: mainColor,
        primaryColor: mainColor,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.black.withOpacity(0.04),
        buttonColor: textDark,
        bottomAppBarColor: Colors.white,
        accentTextTheme: TextTheme(headline1: TextStyle(color: Colors.white)),
        textTheme: TextTheme(
            headline1: TextStyle(color: mainColor.withOpacity(0.9)),
            bodyText1: TextStyle(color: textDark.withOpacity(0.95))),
        hintColor: Colors.black.withOpacity(0.35),
        primaryIconTheme: IconThemeData(color: Colors.black38),
    );
}