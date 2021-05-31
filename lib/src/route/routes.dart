/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';
import './route_handlers.dart';

class Routes {
  static final String root = "/";

  // static final String login = "/account/login";

  void configureParentRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        // ignore: missing_return
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      DebugLog.log("notFoundHandler", "ROUTE WAS NOT FOUND !!!");
    });
    // router.define(root, handler: rootHandler);
    // router.define(login, handler: loginHandler);
//    router.define(deepLink, handler: deepLinkHandler);
  }
}
