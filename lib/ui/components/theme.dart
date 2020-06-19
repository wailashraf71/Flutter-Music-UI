import 'package:flutter/material.dart';

const Color mainColor = Color(0xffFF2D55);
const Color textDark = Color(0xff080808);

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