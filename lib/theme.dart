import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)),
    scaffoldBackgroundColor: const Color(0xFFEAF2FB),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1565C0),
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
  );
}
