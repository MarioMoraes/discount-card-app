import 'package:flutter/material.dart';

class AppUiConfig {
  AppUiConfig._();

  static const MaterialColor _swatch = MaterialColor(0xFF8eb14f, {
    50: Color(0xFF99b961),
    100: Color(0xFFa5c172),
    200: Color(0xFFb0c884),
    300: Color(0xFFbbd095),
    400: Color(0xFFc7d8a7),
    500: Color(0xFFd2e0b9),
    600: Color(0xFFdde8ca),
    700: Color(0xFFe8efdc),
    800: Color(0xFFffffff),
    900: Color(0xFF809f47),
  });

  static String get title => 'Discount Card';

  static var theme = ThemeData(
    fontFamily: 'Lexend',
    primarySwatch: _swatch,
    primaryColor: const Color(0xFF8eb14f),
    primaryColorLight: const Color(0xffb0c884),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );
}
