import 'package:example/app/modules/splash/controllers/splash_service.dart';
import 'package:example/service/auth_service.dart';
import 'package:flutter_eden/eden.dart';

///
class ServiceBindings extends EdenBaseBindings {
  @override
  void edenDependencies() {
    Get.putAsync(() => AuthService().init());
    Get.lazyPut(() => SplashService());
  }
}
