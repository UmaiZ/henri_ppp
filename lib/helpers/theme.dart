import 'package:flutter/material.dart';

final themedata = ThemeData(
    fontFamily: "Work Sans",
    primaryColor: const Color(0xFF03091a),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color(0xFF03091a),
        secondary: Color(0xFF151d2f),
        tertiary: Colors.white,
        onTertiaryContainer: Color(0xffDDDDDD)),
    textTheme: const TextTheme(
        headlineSmall: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        headlineLarge: TextStyle(
            color: Colors.white, fontSize: 21, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w900, color: Colors.white),
        bodySmall: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w900, color: Colors.white)));
