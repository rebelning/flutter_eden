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
import 'package:flutter_eden/eden.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
/// example
extension MyRouteHandler on RouteHandlers {
  ///root
  Handler get rootHandler => Handler(handlerFunc:
          (BuildContext context, Map<String, List<String>> params) {
        return App();
      });

  Handler get loginHandler => Handler(handlerFunc:
          (BuildContext context, Map<String, List<String>> params) {
        return LoginPage();
      });
}
