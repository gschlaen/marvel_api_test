import 'package:flutter/material.dart';
import 'package:marvel_api_test/themes/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = AppTheme.lightTheme;
  bool isLightMode = true;

  setLightMode() {
    currentTheme = AppTheme.lightTheme;
    isLightMode = true;
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = AppTheme.darkTheme;
    isLightMode = false;
    notifyListeners();
  }
}
