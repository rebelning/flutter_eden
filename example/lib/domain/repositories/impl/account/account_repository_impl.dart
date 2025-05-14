import 'package:example/domain/entity/menu_model.dart';
import 'package:example/domain/repositories/account_repository.dart';
import 'package:example/domain/repositories/impl/account/account_provider.dart';
import 'package:flutter_eden/eden.dart';

class AccountRepositoryImpl extends EdenBaseRepository
    implements IAccountRepository {
  final IAccountProvider provider;
  AccountRepositoryImpl({required this.provider});
  @override
  Future<MenuModel?> getMenuList() async {
    return getRepository<MenuModel>(provider.getMenuList());
    // final menu = await porvider.getMenuList();
    // if (menu.status.hasError) {
    //   return Future.error(menu.statusText ?? "");
    // } else {
    //   return menu.body;
    // }
  }
}
