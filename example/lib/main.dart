import 'dart:io';

import 'package:example/app/app_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
//  debugProfileBuildsEnabled = true;
  runApp(AppComponent());
//  runApp(App());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
