import 'package:flutter/material.dart';
import 'package:flutter_eden/src/values/color/colors.dart' as colors;

extension Colors on ColorScheme {
  Color get itemColor => colors.cardColor;

  Color get accentColor => colors.accentColor;

  Color get color_whitle => Color(0xffffffff);
  Color get color_line => Color(0xfff5f5f5);
  Color get color_333333 => Color(0xff333333);
  ///
  Color get color_999999 => Color(0xff999999);
}
