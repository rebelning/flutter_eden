import 'package:example/app/modules/account/controllers/account_controller.dart';
import 'package:example/app/routes/routes.dart';
import 'package:example/config/constants.dart';
import 'package:example/domain/entity/login_model.dart';

import 'package:example/domain/entity/user_model.dart';
import 'package:example/domain/repositories/auth_respository.dart';

import 'package:flutter_eden/eden.dart';

class AuthService extends EdenBaseService {
  // final IAuthRespository respository;
  // AuthService({required this.respository});
  bool? _isLogin;
  bool? get isLogin => _isLogin;

  UserInfo? _userInfo;

  UserInfo? get userInfo => _userInfo;
  String? storageToken;
  Future<AuthService> init() async {
    storageToken = await StorageHelper.get(StorageKeys.token);
    EdenHttpHook.setToken(() => "Bearer $storageToken");
    StorageHelper.get(Constants.USER_INFO).then((value) {
      print("userInfo=$value");
      if (value != null) {
        _isLogin = true;
        final loginInfo = LoginModel.fromRawJson(value);
        print("loginInfo=${loginInfo.toJson()}");
        _userInfo = loginInfo.data;
      } else {
        _isLogin = false;
      }
    });
    return this;
  }

  void clearLogin() async {
    StorageHelper.remove(Constants.USER_INFO);
    await Get.find<AuthService>().init();
    Get.find<AccountController>().update();
  }

  @override
  void onInit() {
    super.onInit();
    print("auth service init...");
    // Get.reload<IAuthProvider>(force: true);
    // Get.lazyReplace<IAuthProvider>(() => AuthProvider());
    // Get.lazyReplace<IAuthRespository>(
    //     () => AuthRespositoryImpl(provider: Get.find()));
    EdenHttpHook.setUnauthorized(() {
      print("setUnauthorized-unauthorized");
      clearLogin();
      EdenRoute.push(Routes.app.login);
    });

    EdenHttpHook.setError((value) {
      print("httpHook-error=$value");

      // EdenSnackbar("${value?.toString()}", title: "Error");
    });
    _netChecked();
  }

  Future _netChecked() async {
    IAuthRespository respository = Get.find<IAuthRespository>();
    respository.doNetChecked().then((value) {
      print("netChecked-value=${value?.toRawJson()}");
    }).onError((error, stackTrace) async {
      print("netChecked-error=${error.toString()}");
      print("AuthService-netChecked-stackTrace=${stackTrace.toString()}");

      // EdenSnackbar(error.toString());
    });
  }
}
