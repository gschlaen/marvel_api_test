import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromRGBO(150, 6, 38, 1);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: primary),
    iconTheme: const IconThemeData(color: primary),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    appBarTheme: AppBarTheme(
      color: Colors.grey[900],
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.black,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: primary, foregroundColor: Colors.white),
    iconTheme: const IconThemeData(color: primary),
  );
}
