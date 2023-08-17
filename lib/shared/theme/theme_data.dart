import 'package:flutter/material.dart';
import 'package:taskify/resources/colors.dart';

class AppTheme {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        primaryColor: kPrimaryColor,
        colorScheme: isDarkTheme
            ? const ColorScheme.dark()
            : const ColorScheme.light(
                primary: kPrimaryColor,
              ),
        scaffoldBackgroundColor:
            isDarkTheme ? const Color.fromARGB(255, 49, 49, 49) : Colors.white,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        appBarTheme: AppBarTheme(),
        listTileTheme: ListTileThemeData(
          tileColor: isDarkTheme ? Colors.grey.shade800 : Colors.grey.shade200,
        ));
  }
}
