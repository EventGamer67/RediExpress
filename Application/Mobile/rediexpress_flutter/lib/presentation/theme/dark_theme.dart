

import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(color:Color(0xFF0560FA),),
      selectedItemColor: Color(0xFF0560FA),
      showUnselectedLabels: true,
      unselectedItemColor: Color.fromARGB(255, 167, 167, 167),
    ),
    colorScheme: const ColorScheme.dark(
        inverseSurface: Colors.white,
        primary: Color(0xFF0560FA),
        background: Color(0xFF000D1D)));