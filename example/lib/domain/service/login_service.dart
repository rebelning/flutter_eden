import 'package:example/domain/http_response.dart';
import 'package:example/domain/mappers/login_mapper.dart';
import 'package:flutter_eden/eden.dart';

class LoginService {
  HttpClient client = inject<HttpClient>();

  Future<HttpResponse> login(String login, String password) async {
    HttpResponse response = HttpResponse();
    final payload = {login, password};
    final retAuth = client.post("", body: payload);

    await retAuth.then((res) {
      response.statusCode = res.statusCode;
      response.data = LoginMapper.fromJson(res.data);
      response.message = res.statusMessage;
    }).catchError((onError) {
      response.statusCode = 500; //失败
      response.data = onError;
      response.message = "login failure";
    });
  }
}
