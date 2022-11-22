import 'package:example/app/modules/splash/controllers/splash_service.dart';
import 'package:example/domain/repositories/auth_respository.dart';
import 'package:example/domain/repositories/impl/auth/auth_provider.dart';
import 'package:example/domain/repositories/impl/auth/auth_respository_impl.dart';
import 'package:example/service/auth_service.dart';
import 'package:example/service/config_service.dart';
import 'package:flutter_eden/eden.dart';

class ServiceBindings extends Bindings {
  @override
  void dependencies() {
    Get.putAsync(() => ConfigService().init());

    Get.lazyPut<IAuthProvider>(() => AuthProvider());
    Get.lazyPut<IAuthRespository>(
        () => AuthRespositoryImpl(provider: Get.find()));

    ///
    Get.putAsync(() => AuthService().init());
    Get.lazyPut(() => SplashService());
  }
}
