import 'package:example/domain/http_response.dart';
import 'package:example/domain/models/user.dart';
import 'package:example/domain/repositories/login_repository.dart';
import 'package:example/domain/service/login_service.dart';
import 'package:flutter_eden/eden.dart';

///
class LoginRepository implements ILoginRepository {
  LoginService service = inject<LoginService>();

  ///
  @override
  Future<HttpResponse<User>> login(String? login, String? password) async {
    HttpResponse response = HttpResponse();
    // final hasConnection = await ConnectionHelper.hasConnection();
    final hasConnection = true;
    if (hasConnection) {
      response = await this.service.login(login, password);
    } else {
      response.message = "Device offline";
    }
    return response.data;
  }
}
