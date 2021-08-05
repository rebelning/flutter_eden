import 'package:example/domain/models/menu.dart';
import 'package:example/domain/repositories/account_repository.dart';
import 'package:example/domain/service/account_service.dart';
import 'package:flutter_eden/eden.dart';

class AccountRepository implements IAccountRepository {
  ///
  AccountService _accountService = inject<AccountService>();

  @override
  Future<HttpResponse<List<Menu>>> getMenuList() async {
    HttpResponse<List<Menu>> response = HttpResponse();
    //response = await _accountService.getMenuList();
    List<Menu> menus = [];
    Menu menu =
        Menu(menuId: "2001", section: "login", action: "/account/login");
    menus.add(menu);
    menu = Menu(menuId: "2002", section: "message", action: "/account/message");
    menus.add(menu);
    menu = Menu(menuId: "2003", section: "setting", action: "/account/setting");
    menus.add(menu);
    menu = Menu(menuId: "2004", section: "sliver", action: "/account/sliver");
    menus.add(menu);
    menu = Menu(menuId: "2005", section: "stock", action: "/stock/stock");
    menus.add(menu);
    response.data = menus;
    response.resCode = 200;
    return response;
  }
}
