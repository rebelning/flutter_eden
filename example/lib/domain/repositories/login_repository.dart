import 'package:example/domain/entity/login_model.dart';

abstract class ILoginRepository {
  ///login
  Future<LoginModel?> doLogin(String? username, String? password);
}
