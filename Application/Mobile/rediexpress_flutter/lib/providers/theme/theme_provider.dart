

import 'package:flutter/material.dart';
import 'package:rediexpress_flutter/presentation/theme/dark_theme.dart';
import 'package:rediexpress_flutter/presentation/theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData theme = lightTheme;

  switchTheme() {
    if (theme == lightTheme) {
      theme = darkTheme;
    } else {
      theme = lightTheme;
    }
    notifyListeners();
  }
}