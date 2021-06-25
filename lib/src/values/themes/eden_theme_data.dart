// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
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
  static final Color _darkCardColor = Color(0xff455A64);///line color
  //icon color
  static final Color _lightIconColor = Color(0xffB0BEC5);
  static final Color _darkIconColor = Color(0xff607D8B);
  ///
  static final Color _lightLineColor = Color(0xffB0BEC5);
  static final Color _darkLineColor = Color(0xff607D8B);

  ///light theme data
  static ThemeData lightThemeData = themeData(
    lightColorScheme,
    _lightFocusColor,
    _lightCursorColor,
    _lightCardColor,
    _lightIconColor,
    _lightLineColor,
  );

  ///dark theme data
  static ThemeData darkThemeData = themeData(
    darkColorScheme,
    _darkFocusColor,
    _darkCursorColor,
    _darkCardColor,
    _darkIconColor,
    _darkLineColor,
  );

  static ThemeData themeData(
    ColorScheme colorScheme,
    Color focusColor,
    Color cursorColor,
    Color cardColor,
    Color iconColor,
    Color lineColor,
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
      cardColor:cardColor ,
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
    );
  }

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
//   Brightness brightness, //深色还是浅色
//   MaterialColor primarySwatch, //主题颜色样本，见下面介绍
//   Color primaryColor, //主色，决定导航栏颜色
//   Color accentColor, //次级色，决定大多数Widget的颜色，如进度条、开关等。
//   Color cardColor, //卡片颜色
//   Color dividerColor, //分割线颜色
//   ButtonThemeData buttonTheme, //按钮主题
//   Color cursorColor, //输入框光标颜色
//   Color dialogBackgroundColor,//对话框背景颜色
//   String fontFamily, //文字字体
//   TextTheme textTheme,// 字体主题，包括标题、body等文字样式
//   IconThemeData iconTheme, // Icon的默认样式
//   TargetPlatform platform, //指定平台，应用特定平台控件风格
// })