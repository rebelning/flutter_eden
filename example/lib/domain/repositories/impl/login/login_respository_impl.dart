import 'package:example/domain/entity/login_model.dart';

import 'package:example/domain/repositories/impl/login/login_provider.dart';
import 'package:example/domain/repositories/login_respository.dart';
import 'package:flutter_eden/eden.dart';

class LoginRespositoryImpl extends EdenBaseRepository
    implements ILoginRespository {
  final ILoginProvider provider;

  LoginRespositoryImpl({
    required this.provider,
  });

  @override
  Future<LoginModel?> doLogin(String? username, String? password) async {
    return getRepository<LoginModel>(provider.doLogin(username, password));
    // final login = await provider.doLogin(username, password);
    // if (login.status.hasError) {
    //   return Future.error(login.statusText ?? "");
    // } else {
    //   print("body=${login.body?.toJson()}");
    //   return login.body;
    // }
  }
}
