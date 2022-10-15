import 'package:example/app/modules/account/controllers/account_controller.dart';
import 'package:example/app/routes/routes.dart';
import 'package:example/config/constants.dart';
import 'package:example/service/auth_service.dart';
import 'package:flutter_eden/eden.dart';

///
class ProfileController extends EdenBaseController {
  @override
  void onInit() {
    super.onInit();
  }

  void onExitLogin() async {
    print("onExitLogin");
    StorageHelper.remove(Constants.USER_INFO);
    await Get.find<AuthService>().init();
    Get.find<AccountController>().update();
    RouteCore.until(Routes.app.root);
  }

  @override
  void dealloc() {
    // TODO: implement dealloc
  }

  @override
  Future doRequest(bool isPull) {
    // TODO: implement doRequest
    throw UnimplementedError();
  }

  @override
  void init() {
    // TODO: implement init
  }
}
