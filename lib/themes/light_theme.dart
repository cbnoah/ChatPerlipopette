import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Color(0xFFF48C25),
    secondary: Color(0xFFF48C25).withAlpha(25),
    surface: Color(0xFFF8F7F5),
    onSurface: Colors.white,
    onInverseSurface: Colors.black,
    onSurfaceVariant: Colors.grey
  ),
);