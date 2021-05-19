/*
 *debug log
 */
import 'package:flutter/material.dart';
import'package:flutter/rendering.dart';
class DebugLog {
  DebugLog();

  /*
   *print log
   */
  static void log(String tag, String des) {
    debugPrint(tag + "=" + des);
  }



  /*
   *
   */
  static void dumpApp() {
    debugDumpApp();
  }

  /*
   *
   */
  static void dumpRenderTree() {
    debugDumpRenderTree();
  }

}
