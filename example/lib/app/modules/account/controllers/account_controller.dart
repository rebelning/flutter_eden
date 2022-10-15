import 'package:example/app/routes/routes.dart';
import 'package:example/domain/entity/menu_model.dart';
import 'package:example/domain/repositories/account_respository.dart';
import 'package:example/service/auth_service.dart';
import 'package:flutter_eden/eden.dart';

class AccountController extends EdenBaseController {
  final IAccountRespository accountRespository;
  AccountController({required this.accountRespository});
  static AccountController get to => Get.find();
  AuthService? authService;

  List<MenuInfo>? menuList = [];
  @override
  void onInit() {
    super.onInit();
    print("Account init...");

    authService = Get.find<AuthService>();

    print("ac-isLogin=${authService?.isLogin}");
    print("ac-userInfo=${authService?.userInfo?.toRawJson()}");

    if (authService?.isLogin == true) {
      getMenuList();
    }
  }

  Future getMenuList() async {
    menuList?.clear();
    return await accountRespository.getMenuList().then((value) {
      _setMenuList(value);
    }).catchError((e) {
      print("error=${e.toString()}");
    });
  }

  void _setMenuList(MenuModel? menuModel) {
    print("menuList:${menuModel?.toRawJson()}");
    menuList?.addAll(menuModel?.data ?? []);
    update();
  }

  ///to setting
  void toSetting() {
    RouteCore.push(Routes.app.accountProfile);
  }

  @override
  Future doRequest(bool isPull) async {}

  @override
  void dealloc() {}

  @override
  void init() {}
}
