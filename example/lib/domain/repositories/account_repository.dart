import 'package:example/domain/entity/menu_model.dart';

abstract class IAccountRepository {
  Future<MenuModel?> getMenuList();
}
