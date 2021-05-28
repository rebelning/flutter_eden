import 'package:example/domain/http_response.dart';
import 'package:example/domain/mappers/login_mapper.dart';
import 'package:example/domain/models/user.dart';
import 'package:flutter_eden/eden.dart';

class LoginService {
  HttpClient client = inject<HttpClient>();

  Future<HttpResponse> login(String login, String password) async {
    HttpResponse<User> response = HttpResponse();
    final url = "http://192.168.162.104:8080/eden/auth/login";
    final payload = {"username": login, "password": password};
    final retAuth = client.post(url, body: payload);

    await retAuth.then((res) {
      response.resCode = res.statusCode;
      response.data = LoginMapper.fromJson(res.data);
    }).catchError((onError) {
      response.resCode = 500; //失败
      response.data = onError;
      response.message = "login failure";
    });
    print("HttpResponse=$response");
    return response;
  }
}
