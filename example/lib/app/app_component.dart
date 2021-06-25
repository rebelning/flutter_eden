import 'package:example/config/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppComponent extends StatefulWidget {
  @override
  State createState() {
    return AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    final router = FluroRouter();

    ///
    Routes.configureRoutes(router);

    ///
    ///
    Application.router = router;
  }
  @override
  void initState() {
    super.initState();
    getThemeMode();
  }

  void getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? mode = prefs.getInt("themeMode");
    final options = EdenOptions.of(context);
    if (mode == 0) {
      EdenOptions.update(
      context,
      options.copyWith(themeMode: ThemeMode.light),
    );
    } else {
    EdenOptions.update(
      context,
      options.copyWith(themeMode: ThemeMode.dark),
    );
      DebugLog.log("EdenOptions.of(context).themeMode,", "${EdenOptions.of(context).themeMode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    DebugLog.log("EdenOptions.of(context).themeMode,", "${EdenOptions.of(context).themeMode}");
    final app = MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('zh', ''), // Spanish, no country code
      ],
      debugShowCheckedModeBanner: false,
      themeMode: EdenOptions.of(context).themeMode,
      theme: EdenThemeData.lightThemeData.copyWith(
        platform: EdenOptions.of(context).platform,
      ),
      darkTheme: EdenThemeData.darkThemeData.copyWith(
        platform: EdenOptions.of(context).platform,
      ),
      locale: EdenOptions.of(context).locale,
      localeResolutionCallback: (locale, supportedLocales) {
        deviceLocale = locale;
        return locale;
      },
      onGenerateRoute: Application.router?.generator,
    );
//    print("initial route = ${app.initialRoute}");
    return app;
  }
}
