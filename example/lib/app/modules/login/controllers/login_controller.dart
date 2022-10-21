import 'package:example/app/modules/account/controllers/account_controller.dart';
import 'package:example/config/constants.dart';
import 'package:example/domain/entity/login_model.dart';
import 'package:example/domain/repositories/login_respository.dart';
import 'package:example/service/auth_service.dart';
import 'package:flutter_eden/eden.dart';

class LoginController extends EdenBaseController {
  final ILoginRespository loginRespository;
  LoginController({required this.loginRespository});
  String? _username;
  String? _password;
  String? get username => _username;
  String? get password => _password;

  @override
  void init() {}

  void setUsername(String? username) {
    _username = username;
  }

  void setPassword(String? password) {
    _password = password;
  }

  Future<bool?> onLogin() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    print("onLogin-username=$username -password=$password");

    return await loginRespository.doLogin(username, password).then((value) {
      return _loginSuccess(value);
    }).catchError((error) {
      return _loginFailure(error);
    }).then((value) async {
      print("auth refresh=$value");
      if (value == true) {
        await Get.find<AuthService>().init();
        AccountController.to.update();
      }
      return value;
    });
  }

  bool? _loginSuccess(LoginModel? login) {
    print("loginModel=${login?.toJson()}");
    if (login?.resCode == 200) {
      StorageHelper.set(StorageKeys.token, login?.data?.accessToken);
      StorageHelper.set(Constants.USER_INFO, login?.toRawJson());
      return true;
    } else {
      Snackbar("${login?.message}", title: "Message");
      return false;
    }
  }

  bool _loginFailure(dynamic error) {
    print("error=$error");
    Snackbar("${error.toString()}", title: "Error");

    return false;
  }

  @override
  void dealloc() {}
}
