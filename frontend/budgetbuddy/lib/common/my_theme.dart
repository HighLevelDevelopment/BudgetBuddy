import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: const Color.fromRGBO(248, 248, 255, 1),
      secondary: Colors.black,
    ),
    brightness: Brightness.light,
    useMaterial3: true,
  );
}