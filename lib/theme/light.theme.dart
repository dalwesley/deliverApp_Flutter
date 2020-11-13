import 'package:flutter/material.dart';

const brightness = Brightness.light;
// const brightness = Brightness.dark;
const primaryColor = const Color(0xFF2c3450); //azul
const accentColor = const Color(0xFF5d8df7); //verde
const backgroundColor = const Color(0xFFf6f9ff); //azul claro
const textColor = const Color(0xFF2e3652); //cinza

ThemeData lightTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: new TextTheme(
      bodyText1: new TextStyle(
        fontFamily: "BAHNSCHRIFT",
        color: primaryColor,
        fontSize: 30,
      ),
      bodyText2: TextStyle(
        fontFamily: "BAHNSCHRIFT",
      ),
      headline1: TextStyle(
        fontFamily: "BAHNSCHRIFT",
      ),
      headline2: TextStyle(
        fontFamily: "BAHNSCHRIFT",
      ),
      button: TextStyle(
        fontFamily: "BAHNSCHRIFT",
      ),
      caption: TextStyle(
        fontFamily: "BAHNSCHRIFT",
      ),
      subtitle1: TextStyle(
        fontFamily: "BAHNSCHRIFT",
      ),
      subtitle2: TextStyle(
        fontFamily: "BAHNSCHRIFT",
      ),
    ),
    primaryColor: primaryColor,
    accentColor: accentColor,
    backgroundColor: backgroundColor,
    buttonColor: textColor,
  );
}
