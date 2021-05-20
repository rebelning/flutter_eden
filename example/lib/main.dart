import 'dart:io';

import 'package:example/app/app_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eden/eden.dart';
import 'package:example/di/injector_provider_impl.dart';

void main() {
//  debugProfileBuildsEnabled = true;
  ///
  setupInjection();
  ///
  setupInjectionImpl();
  ///
  runApp(AppComponent());
//  runApp(App());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
