import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.grey,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: const Color.fromRGBO(248, 248, 255, 1),
      secondary: Colors.black,
    ),
    brightness: Brightness.light,
    useMaterial3: true,
  );

  static const Color darkColor = Color.fromRGBO(141, 153, 174, 1);
  static const Color highlightColor = Color.fromRGBO(43, 45, 66, 1);
  static const Color lightColor = Color.fromRGBO(237, 242, 244, 1);
  static const Color deleteColor = Color.fromRGBO(216, 0, 50, 1);
}