import 'package:example/domain/domain.dart';
import 'package:example/domain/entity/menu_model.dart';
import 'package:flutter_eden/eden.dart';

abstract class IAccountPorvider {
  Future<Response<MenuModel?>> getMenuList();
}

class AccountProvider extends HttpTask implements IAccountPorvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => MenuModel.fromJson(val as Map<String, dynamic>);
    super.onInit();
  }

  @override
  Future<Response<MenuModel?>> getMenuList() {
    final path = appList.menuList;
    return get(path);
  }
}
