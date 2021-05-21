import 'package:flutter/material.dart';

final Color accentColor = Color(0xFF53ac6d);
final Color accentLightColor = Color(0xFF53ac6d);

final Color primaryColor = Color(0xFFd7dae0);
final Color primaryColorDark = Color(0xFFabb2bf);

final Color titleColor = Color(0xFFFFFFFF);

final Color facebookColor = Color(0xFFf4d6cac);
final Color lineColor = Color(0xFFF5F5F5);
final Color textColor = Color(0xFFFFFFFF);

final Color backgroundColor = Color(0xFFFFFFFF);
final Color backgroundDarkColor = Color(0xFF21252b);
final Color cardColor = Color(0xFF2b2d34);

final Color backgroundGradient1 = Color(0xFF202025);
final Color backgroundGradient2 = Color(0xFF393838);
final Color backgroundGradient3 = Color(0xFF202025);

final Color disabledTextColor = Color(0xFFa1a1a1);
final Color disabledColor = Colors.black38;

final Color canvasColor = Colors.transparent;

final Color snackbarBackgroundColor = Colors.black38;
final Color toastBackgroundColor = Colors.black38;
final Color toastTextColor = Colors.white;
///button
final Color btnBackgroundColor = Colors.blue;

extension ColorThemeHelpers on ColorScheme {
  Color get toolbarTitleColor => titleColor;
}
