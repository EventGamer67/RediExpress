import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(
        color: Color(0xFF0560FA),
      ),
      selectedItemColor: Color(0xFF0560FA),
      showUnselectedLabels: true,
      unselectedItemColor: Color.fromARGB(255, 167, 167, 167),
    ),
    colorScheme: const ColorScheme.light(
        onBackground: Colors.white,
        error: Color.fromARGB(255, 237, 58, 58),
        inverseSurface: Color.fromARGB(255, 58, 58, 58),
        primary: Color(0xFF0560FA),
        background: Colors.white));
