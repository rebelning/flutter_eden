// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_eden/src/values/style/eden_button_style.dart';
import 'package:google_fonts/google_fonts.dart';

class EdenThemeData {
  // static const _lightFillColor = Colors.black;
  static const _lightFillColor = Colors.white;
  static const _darkFillColor = Colors.white;

  ///
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  ///cursor color
  static final Color _lightCursorColor = Color(0xff0091EA);
  static final Color _darkCursorColor = Color(0xffFFFFFF);

  ///card color
  static final Color _lightCardColor = Color(0xffECEFF1);
  static final Color _darkCardColor = Color(0xff455A64);

  ///line color
  //icon color
  static final Color _lightIconColor = Color(0xff607D8B);
  static final Color _darkIconColor = Color(0xffB0BEC5);

  ///
  static final Color _lightLineColor = Color(0xffB0BEC5);
  static final Color _darkLineColor = Color(0xff607D8B);

  ///selected
  static final Color _lightSelectedLabelColor = Color(0xff0091EA);
  static final Color _darkSelectedLabelColor = Color(0xffffffff);

  ///Un selected
  static final Color _lightUnSelectedLabelColor = Color(0xffB0BEC5);
  static final Color _darkUnSelectedLabelColor = Color(0xffB0BEC5);

  static final Color _lightSelectedItemColor = Color(0xff0091EA);
  static final Color _darkSelectedItemColor = Color(0xffB0BEC5);

  ///
  static final Color _lightUnSelectedItemColor = Color(0xff455A64);
  static final Color _darkUnSelectedItemColor = Color(0xffFFFFFF);

  ///light theme data
  static ThemeData lightThemeData = themeData(
    lightColorScheme,
    _lightFocusColor,
    _lightCursorColor,
    _lightCardColor,
    _lightIconColor,
    _lightLineColor,
    _lightSelectedLabelColor,
    _lightUnSelectedLabelColor,
    _lightSelectedItemColor,
    _lightUnSelectedItemColor,
  );

  ///dark theme data
  static ThemeData darkThemeData = themeData(
    darkColorScheme,
    _darkFocusColor,
    _darkCursorColor,
    _darkCardColor,
    _darkIconColor,
    _darkLineColor,
    _darkSelectedLabelColor,
    _darkUnSelectedLabelColor,
    _darkUnSelectedItemColor,
    _darkSelectedItemColor,
  );

  static ThemeData themeData(
    ColorScheme colorScheme,
    Color focusColor,
    Color cursorColor,
    Color cardColor,
    Color iconColor,
    Color lineColor,
    Color selectedLabelColor,
    Color unSelectedLabelColor,
    Color selectedItemColor,
    Color unSelectedItemColor,
  ) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      // Matches manifest.json colors and background color.
      //primaryColor: const Color(0xFF030303),
      primaryColor: colorScheme.primary,
      //appbar
      appBarTheme: AppBarTheme(
        textTheme: _textTheme.apply(bodyColor: colorScheme.onPrimary),
        // color: colorScheme.background,
        color: colorScheme.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        brightness: colorScheme.brightness,
      ),
      iconTheme: IconThemeData(color: iconColor),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.subtitle1?.apply(color: _darkFillColor),
      ),
      cardColor: cardColor,
      dividerColor: lineColor,
      dividerTheme:
          DividerThemeData(color: lineColor, space: 0.6, thickness: 0.6),

      ///input
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: colorScheme.primary)),

      ///
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: cursorColor,
        selectionColor: colorScheme.onPrimary,
      ),
      textButtonTheme: TextButtonThemeData(
          style: EdenButtonStyle.flatButtonStyle(colorScheme)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: EdenButtonStyle.raisedButtonStyle(colorScheme)),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: EdenButtonStyle.outlineButtonStyle(colorScheme)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
            color: selectedLabelColor,
            fontFamily: _textTheme.subtitle1?.fontFamily),
        unselectedLabelStyle: TextStyle(
            color: unSelectedLabelColor,
            fontFamily: _textTheme.subtitle1?.fontFamily),
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unSelectedItemColor,
        selectedIconTheme: IconThemeData(color: selectedItemColor),
        unselectedIconTheme: IconThemeData(color: unSelectedItemColor),
      ),
    );
  }

  ///light color scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF0091EA),
    primaryVariant: Color(0xFF00B0FF),
    secondary: Color(0xFFEFF3F3),
    secondaryVariant: Color(0xFFFAFBFB),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  ///dark color scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xff263238),
    primaryVariant: Color(0xff5f7486),
    secondary: Color(0xff5f7486),
    secondaryVariant: Color(0xff5f7486),
    background: Color(0xff37474F),
    surface: Color(0xFF37474F),
    onBackground: Color(0xff37474F), // White with 0.05 opacity

    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headline4: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
    caption: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
    headline5: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0),
    subtitle1: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
    overline: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
    bodyText1: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
    subtitle2: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
    bodyText2: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
    headline6: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
    button: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
  );
}
// ThemeData({
//   Brightness brightness, //??????????????????
//   MaterialColor primarySwatch, //????????????????????????????????????
//   Color primaryColor, //??????????????????????????????
//   Color accentColor, //???????????????????????????Widget???????????????????????????????????????
//   Color cardColor, //????????????
//   Color dividerColor, //???????????????
//   ButtonThemeData buttonTheme, //????????????
//   Color cursorColor, //?????????????????????
//   Color dialogBackgroundColor,//?????????????????????
//   String fontFamily, //????????????
//   TextTheme textTheme,// ??????????????????????????????body???????????????
//   IconThemeData iconTheme, // Icon???????????????
//   TargetPlatform platform, //?????????????????????????????????????????????
// })