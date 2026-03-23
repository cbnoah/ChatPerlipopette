import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFFF48C25),
    secondary: const Color(0xFFF48C25).withAlpha(45),
    surface: const Color(0xFF2E2E2E),
    onSurface: Color(0xFF6A6A6A),
    onInverseSurface: Colors.white,
    onSurfaceVariant: Colors.grey.shade400,
  ),
);
