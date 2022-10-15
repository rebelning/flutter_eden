/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:example/app.dart';
import 'package:example/ui/login/login_page.dart';
import 'package:example/ui/message/message_page.dart';
import 'package:example/ui/setting/setting_page.dart';
import 'package:example/ui/sliver/sliver_page.dart';
import 'package:example/ui/stock/stock_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

///root
var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return App();
});
var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return LoginPage();
});
var messageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return MessagePage();
});
var settingHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return SettingPage();
});
var sliverHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return SliverPage();
});

///
var stockHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return StockPage();
});

/// Handles deep links into the app
/// To test on Android:
///
/// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
var deepLinkHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  // String? colorHex = params["color_hex"]?.first;
  // String? result = params["result"]?.first;
  // Color color = Color(0xFFFFFFFF);
  // if (colorHex != null && colorHex.length > 0) {
  //   color = Color(ColorHelpers.fromHexString(colorHex));
  // }
//  return DemoSimpleComponent(
//      message: "DEEEEEP LINK!!!", color: color, result: result);
  return null;
});
