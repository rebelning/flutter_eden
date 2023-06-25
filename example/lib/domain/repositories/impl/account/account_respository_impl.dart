import 'package:example/domain/entity/menu_model.dart';
import 'package:example/domain/repositories/account_respository.dart';
import 'package:example/domain/repositories/impl/account/account_provider.dart';
import 'package:flutter_eden/eden.dart';

class AccountRespositoryImpl extends EdenBaseRespository
    implements IAccountRespository {
  final IAccountPorvider provider;
  AccountRespositoryImpl({required this.provider});
  @override
  Future<MenuModel?> getMenuList() async {
    return getRespository<MenuModel>(provider.getMenuList());
    // final menu = await porvider.getMenuList();
    // if (menu.status.hasError) {
    //   return Future.error(menu.statusText ?? "");
    // } else {
    //   return menu.body;
    // }
  }
}
