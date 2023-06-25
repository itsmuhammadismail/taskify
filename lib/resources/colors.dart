import 'package:flutter/material.dart';

// Colors
const kPrimaryColor = MaterialColor(
  0xFFCBAACB, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: Color(0xFFCBAACB), //10%
    100: Color(0xFFCBAACB), //20%
    200: Color(0xFFCBAACB), //30%
    300: Color(0xFFCBAACB), //40%
    400: Color(0xFFCBAACB), //50%
    500: Color(0xFFCBAACB), //60%
    600: Color(0xFFCBAACB), //70%
    700: Color(0xFFCBAACB), //80%
    800: Color(0xFFCBAACB), //90%
    900: Color(0xFFCBAACB), //100%
  },
);
const kGray100 = Color(0xFFF4F6F9);
const kGray200 = Color(0xFFEEEFF1);
const kGray500 = Color(0xFF9E9E9E);
const kDisabledColor = Color(0xFF232323);
const kTextFieldColor = Color(0xFFF3F2F2);
const kBackgroundColor = Color(0xFF2F2F7E);
