import 'package:flutter/material.dart';
import 'package:taskify/resources/colors.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: kPrimaryColor,
      colorScheme: const ColorScheme.light(
        primary: kPrimaryColor,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
