import 'package:flutter/material.dart';

class AppTheme {
  static CustomThemeColors colors = CustomThemeColors();
  static CustomTextStyles textStyles = CustomTextStyles();
}

class CustomThemeColors {
  Color primary = const Color.fromARGB(255, 168, 155, 53);
  Color secondary = const Color.fromARGB(255, 125, 207, 128);

  Color background = Colors.black54;
  Color border = const Color.fromARGB(255, 255, 238, 0);
  Color cursor = Colors.white;
}

class CustomTextStyles {
  TextStyle menu = const TextStyle(
    color: Colors.white60,
    fontWeight: FontWeight.w600,
  );

  TextStyle hintText = const TextStyle(
    color: Colors.white60,
    fontWeight: FontWeight.w600,
  );
}
