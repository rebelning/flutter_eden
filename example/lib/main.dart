import 'package:example/domain/repositories/auth_respository.dart';
import 'package:example/domain/repositories/impl/auth/auth_provider.dart';
import 'package:example/domain/repositories/impl/auth/auth_respository_impl.dart';
import 'package:flutter_eden/eden.dart';

import 'app/modules/splash/controllers/splash_service.dart';
import 'app/modules/splash/views/splash_view.dart';
import 'app/routes/routes.dart';

import 'service/auth_service.dart';

void main() {
  runApp(
    EdenMaterialWrapper(
      logTag: "Example",
      initialRoute: Routes.app.root,
      unknownRoute: Routes.app.unknownRoute,
      getPages: Routes.getPages(),
      theme: EdenThemeData.lightThemeData(),
      initialBinding: BindingsBuilder(
        () {
          Get.lazyPut<IAuthProvider>(() => AuthProvider());
          Get.lazyPut<IAuthRespository>(
              () => AuthRespositoryImpl(provider: Get.find()));
          Get.putAsync(() => AuthService(respository: Get.find()).init());
          Get.lazyPut(() => SplashService());
        },
      ),
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
