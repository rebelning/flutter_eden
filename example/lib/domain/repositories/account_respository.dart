import 'package:example/domain/entity/menu_model.dart';

abstract class IAccountRespository {
  Future<MenuModel?> getMenuList();
}
