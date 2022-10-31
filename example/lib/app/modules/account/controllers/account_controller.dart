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
  final _refreshController = RefreshController();
  RefreshController get refreshController => _refreshController;
  @override
  void init() {
    print("Account init...");

    authService = Get.find<AuthService>();

    print("ac-isLogin=${authService?.isLogin}");
    print("ac-userInfo=${authService?.userInfo?.toRawJson()}");

    if (authService?.isLogin == true) {
      getMenuList();
    } else {
      initMenu();
    }
  }

  ///
  Future onRefresh() async {
    // monitor network fetch
    menuList?.clear();
    initMenu();
    await Future.delayed(const Duration(seconds: 2));
    _refreshController.refreshCompleted();
  }

  void initMenu() {
    menuList?.add(
      MenuInfo(
        menuId: "1",
        section: "Home",
      ),
    );
    menuList?.add(
      MenuInfo(
        menuId: "2",
        section: "Setting",
      ),
    );
    menuList?.add(
      MenuInfo(
        menuId: "3",
        section: "Login",
        action: Routes.app.login,
      ),
    );
    menuList?.add(
      MenuInfo(
        menuId: "4",
        section: "About",
      ),
    );
    menuList?.add(
      MenuInfo(
        menuId: "5",
        section: "Proxy Setting",
        action: Routes.eden.proxySeting,
      ),
    );
    for (int i = 0; i < 20; i++) {
      menuList?.add(
        MenuInfo(),
      );
    }
    update();
  }

  void onRouteView(String? route) {
    EdenRoute.push(route ?? "");
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
    EdenRoute.push(Routes.app.accountProfile);
  }

  @override
  Future doRequest(bool isPull) async {}

  @override
  void dealloc() {}
}
