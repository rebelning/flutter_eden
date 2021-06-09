import 'package:example/domain/http_response.dart';
import 'package:example/domain/mappers/login_mapper.dart';
import 'package:example/domain/models/user.dart';
import 'package:flutter_eden/eden.dart';
import 'package:example/domain/base/end_points.dart' as Endpoints;

class LoginService {
  HttpClient client = inject<HttpClient>();

  Future<HttpResponse> login(String? login, String? password) async {
    HttpResponse<User> response = HttpResponse();
    final url = Endpoints.login.login;
    final payload = {"username": login, "password": password};
    final retAuth = client.post(url, body: payload);

    await retAuth.then((res) {
      response.resCode = res.statusCode!;

      User user = LoginMapper.fromJson(res.data["data"]);
      response.data=user;
      StorageHelper.set(StorageKeys.token, user.accessToken);
    }).catchError((onError) {
      response.resCode = 500; //失败
      // response.data = onError;
      response.message = "login failure";
      DebugLog.log("onError","${onError.toString()}");


    });
    print("HttpResponse=$response");
    return response;
  }
}
