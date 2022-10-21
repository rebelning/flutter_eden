import 'package:example/app/modules/root/controllers/app_controller.dart';
import 'package:example/app/modules/root/views/app_component.dart';

import 'package:flutter_eden/eden.dart';

import 'app/modules/account/controllers/account_controller.dart';

import 'app/modules/home/controllers/home_controller.dart';
import 'app/modules/message/controllers/message_controller.dart';
import 'app/modules/splash/controllers/splash_service.dart';
import 'app/modules/splash/views/splash_view.dart';
import 'app/routes/routes.dart';
import 'domain/repositories/account_respository.dart';
import 'domain/repositories/impl/account/account_provider.dart';
import 'domain/repositories/impl/account/account_respository_impl.dart';
import 'service/auth_service.dart';

void main() {
  runApp(
    EdenMaterialWrapper(
      unknownRoute: Routes.app.unknownRoute,
      getPages: Routes.getPages(),
      home: AppComponent(),
      theme: EdenThemeData.lightThemeData(),
      initialBinding: BindingsBuilder(
        () {
          Get.putAsync(() => AuthService().init());
          Get.lazyPut(() => SplashService());
          Get.lazyPut(() => AppController());
          Get.lazyPut(() => HomeController());
          Get.lazyPut(() => MessageController());
          Get.lazyPut<IAccountPorvider>(() => AccountProvider());
          Get.lazyPut<IAccountRespository>(
              () => AccountRespositoryImpl(porvider: Get.find()));
          Get.lazyPut(() => AccountController(accountRespository: Get.find()));
        },
      ),
      splashBuilder: (context, child) {
        // final botToastBuilder = BotToastInit();
        // child = botToastBuilder(context, child);
        return FutureBuilder<void>(
          key: const ValueKey('initFuture'),
          future: Get.find<SplashService>().init(),
          builder: (context, snapshot) {
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
