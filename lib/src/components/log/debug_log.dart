/*
 *debug log
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DebugLog {
  DebugLog();

  /*
   *print log
   */
  static void log(String tag, String des) {
    if (kDebugMode) debugPrint(tag + "=" + des);
  }

  /*
   *
   */
  static void dumpApp() {
    if (kDebugMode) debugDumpApp();
  }

  /*
   *
   */
  static void dumpRenderTree() {
    if (kDebugMode) debugDumpRenderTree();
  }
}
