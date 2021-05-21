import 'package:example/domain/http_response.dart';

///login repository
abstract class ILoginRepository{
  Future<HttpResponse> login(String login, String password);

}