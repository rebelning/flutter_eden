import 'package:example/app/modules/account/controllers/account_controller.dart';
import 'package:example/app/modules/home/controllers/home_controller.dart';
import 'package:example/app/modules/message/controllers/message_controller.dart';
import 'package:example/app/modules/root/controllers/app_controller.dart';
import 'package:example/domain/repositories/account_respository.dart';
import 'package:example/domain/repositories/impl/account/account_provider.dart';
import 'package:example/domain/repositories/impl/account/account_respository_impl.dart';
import 'package:flutter_eden/eden.dart';

///
class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut<IAccountPorvider>(() => AccountProvider());
    Get.lazyPut<IAccountRespository>(
        () => AccountRespositoryImpl(porvider: Get.find()));
    Get.lazyPut(() => AccountController(accountRespository: Get.find()));
  }
}
