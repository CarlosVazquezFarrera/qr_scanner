import 'package:flutter/material.dart';

class CustomTheme {
  static const primaryColor = Colors.deepPurple;
  static final ThemeData customTheme = ThemeData(
      listTileTheme: const ListTileThemeData(iconColor: primaryColor),
      appBarTheme: const AppBarTheme(centerTitle: true, color: primaryColor),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(selectedItemColor: primaryColor),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: primaryColor));
}
