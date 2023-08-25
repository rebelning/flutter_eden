import 'package:example/service/auth_service.dart';
import 'package:example/values/app_translations.dart';
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
      onGetPages: () => Routes.getPages(),
      onTheme: () => EdenThemeData.lightThemeData(),
      initialBinding: BindingsBuilder(
        () {
          Get.putAsync(() => AuthService().init());
          Get.lazyPut(() => SplashService());
        },
      ),
      translations: AppTranslations(),
      locale: const Locale('en', 'US'), // 默认的语言
      fallbackLocale: const Locale('en', 'US'), // 当指定的语言没有提供本地化字符串时使用的备用语言

      splashBuilder: (context, child) {
        // final botToastBuilder = BotToastInit();
        // child = botToastBuilder(context, child);

        return FutureBuilder<void>(
          key: const ValueKey('initFuture'),
          future: Get.find<SplashService>().init(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
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
