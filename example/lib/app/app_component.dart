
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';
import 'package:example/config/routes_extension.dart';

class AppComponent extends StatefulWidget {
  @override
  State createState() {
    return AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    final router = FluroRouter();
    final routes=Routes();
    ///
    routes.configureParentRoutes(router);
    ///
    routes.configureRoutes(router);
    ///
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
//          visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Color(0xfff5f5f5),
      ),
      onGenerateRoute: Application.router.generator,
    );
//    print("initial route = ${app.initialRoute}");
    return app;
  }
}
