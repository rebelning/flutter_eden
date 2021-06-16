import 'package:flutter_eden/eden.dart';
///login repository
abstract class ILoginRepository{
  Future<HttpResponse> login(String login, String password);

}