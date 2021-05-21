import 'package:example/domain/http_response.dart';
import 'package:example/domain/repositories/account_repository.dart';
import 'package:example/domain/service/account_service.dart';
import 'package:flutter_eden/eden.dart';

class AccountRepository implements IAccountRepository {
  ///
  AccountService _accountService = inject<AccountService>();

  @override
  Future<HttpResponse> getMenuList() async {
    HttpResponse response = HttpResponse();
    response = await _accountService.getMenuList();

    return response;
  }
}
