/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:example/config/route_handlers_extension.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';

extension MyRoutes on Routes {
  static final String root = "/";
  static final String login = "/account/login";

   void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        // ignore: missing_return
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      DebugLog.log("notFoundHandler", "ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: RouteHandlers().rootHandler);
    router.define(login, handler: RouteHandlers().loginHandler);
//    router.define(deepLink, handler: deepLinkHandler);
  }



}
