import 'package:example/app/routes/routes.dart';
import 'package:example/domain/entity/menu_model.dart';
import 'package:flutter_eden/eden.dart';

class HomeController extends EdenBaseListController {
  HomeController get to => Get.find();

  List<MenuInfo>? sourceList = [];

  void onMenuInfo(MenuInfo? menu) {
    print("menu-path=${menu?.action}");

    // EdenRoute.push(menu?.action ?? Routes.app.error404);
    EdenRoute.push(menu?.action ?? "");
  }

  @override
  void init() {
    print("init...");
  }

  @override
  bool get enablePull => true;

  @override
  void dealloc() {}

  @override
  Future doRequest(bool isPull) async {
    print("doRequest...");
    initMenu();
  }

  void initMenu() {
    sourceList?.clear();
    MenuInfo? menuInfo = MenuInfo();
    menuInfo.menuId = "1";
    menuInfo.section = "Page";
    menuInfo.action = Routes.component.page;
    sourceList?.add(menuInfo);

    ///
    menuInfo = MenuInfo();
    menuInfo.menuId = "1";
    menuInfo.section = "Dialog";
    menuInfo.action = Routes.component.dialog;
    sourceList?.add(menuInfo);

    ///
    menuInfo = MenuInfo();
    menuInfo.menuId = "2";
    menuInfo.section = "Input";
    sourceList?.add(menuInfo);

    ///
    menuInfo = MenuInfo();
    menuInfo.menuId = "3";
    menuInfo.section = "Button";
    menuInfo.action = Routes.component.buttonView;
    sourceList?.add(menuInfo);

    ///
    menuInfo = MenuInfo();
    menuInfo.menuId = "4";
    menuInfo.section = "Filter";
    sourceList?.add(menuInfo);

    ///
    menuInfo = MenuInfo();
    menuInfo.menuId = "5";
    menuInfo.section = "Loadding";
    sourceList?.add(menuInfo);
    update();
  }
}
