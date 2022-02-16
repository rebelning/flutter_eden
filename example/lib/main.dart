import 'dart:io';
import 'package:example/app/app_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eden/eden.dart';
import 'package:example/di/injector_provider_impl.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
// import 'package:google_fonts/google_fonts.dart';

// export 'package:gallery/data/demos.dart' show pumpDeferredLibraries;
void main() {
//  debugProfileBuildsEnabled = true;
  ///
  // GoogleFonts.config.allowRuntimeFetching = false;
  setupInjection();

  ///
  setupInjectionImpl();

  ///
  // runApp(AppComponent());
  runApp(ExampleApp());
//  runApp(App());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({
    Key? key,
    this.initialRoute,
    this.isTestMode = false,
  }) : super(key: key);

  final bool? isTestMode;
  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: EdenOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        customTextDirection: CustomTextDirection.localeBased,
        locale: null,
        timeDilation: timeDilation,
        // platform: defaultTargetPlatform,
        isTestMode: isTestMode,
      ),
      child: Builder(
        builder: (context) {
          return AppComponent();
        },
      ),
    );
  }
}
