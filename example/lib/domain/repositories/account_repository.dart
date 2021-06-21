

import 'package:flutter_eden/eden.dart';

abstract class IAccountRepository{
  Future<HttpResponse> getMenuList();
}