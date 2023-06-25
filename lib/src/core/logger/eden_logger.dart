// import 'package:flutter_eden/eden.dart';

mixin Logger {
  // Sample of abstract logging function
  static void edenWrite(String text,
      {String? logTag = "Eden", bool isError = false}) {
    Future.microtask(() => print('$logTag $text. isError: [$isError]'));
    // Future.microtask(() => printInfo(info:'$logTag $text. isError: [$isError]'));
  }
}
