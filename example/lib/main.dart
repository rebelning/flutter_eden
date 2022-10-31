import 'package:example/service/bindings/service_bindings.dart';

import 'package:flutter_eden/eden.dart';

import 'app/modules/splash/controllers/splash_service.dart';
import 'app/modules/splash/views/splash_view.dart';
import 'app/routes/routes.dart';

void main() {
  runApp(
    EdenMaterialWrapper(
      logTag: "Example",
      enableLog: true,
      initialRoute: Routes.app.root,
      unknownRoute: Routes.app.unknownRoute,
      getPages: Routes.getPages(),
      theme: EdenThemeData.lightThemeData(),
      initialBinding: ServiceBindings(),
      splashBuilder: (context, child) {
        // final botToastBuilder = BotToastInit();
        // child = botToastBuilder(context, child);
        return FutureBuilder<void>(
          key: const ValueKey('initFuture'),
          future: Get.find<SplashService>().init(),
          builder: (context, snapshot) {
            print("snapshot=${snapshot.connectionState}");
            if (snapshot.connectionState == ConnectionState.done) {
              return child ?? const SizedBox.shrink();
            }
            return SplashView();
          },
        );
      },
    ),
  );
  EdenThemeData.systemUiOverlay();
}
