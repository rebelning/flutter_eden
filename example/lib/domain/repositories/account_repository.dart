

import 'package:example/domain/http_response.dart';

abstract class IAccountRepository{
  Future<HttpResponse> getMenuList();
}