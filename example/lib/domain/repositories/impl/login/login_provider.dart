import 'package:example/domain/base/end_points.dart';
import 'package:example/domain/entity/login_model.dart';
import 'package:flutter_eden/eden.dart';

abstract class ILoginProvider {
  Future<Response<LoginModel>> doLogin(String? username, String? password);
}

class LoginProvider extends EdenBaseProvider implements ILoginProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => LoginModel.fromJson(val as Map<String, dynamic>);
    super.onInit();
  }

  @override
  Future<Response<LoginModel>> doLogin(String? username, String? password) {
    final path = login.authLogin;
    final playload = {
      "username": username,
      "password": password,
    };
    return post(path, playload);
  }

  @override
  bool? needToken() {
    return false;
  }
}
