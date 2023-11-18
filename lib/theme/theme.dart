import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primaryColor: Colors.yellow,
  scaffoldBackgroundColor: Color(0xFF151515),
  canvasColor: Colors.yellow,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 92,
      color: Colors.white,
      fontWeight: FontWeight.w900,
    ),
    displaySmall: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
  ),
  colorScheme:
      ColorScheme.fromSwatch(primarySwatch: Colors.yellow).copyWith(background: Color(0xFF151515)),
);
