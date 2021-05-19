import 'package:example/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';

class App extends AbstractMVVMBaseNav {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends AbstractMVVMBaseNavState<App> {
  @override
  bool getHideToolbar() {

    return false;
  }

  @override
  bool getHideToolbarArrowBack() {
    return false;
  }

  @override
  String getToolbarTitle() {
    return "首页";
  }

  @override
  List<BottomNavigationBarItem> getBarItems() {
    return [
      BottomNavigationBarItem(
        label: Text("首页").data,
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: Text("课程").data,
        icon: Icon(Icons.import_contacts),
      ),
      BottomNavigationBarItem(
        label: Text("我的").data,
        icon: Icon(Icons.account_circle),
      ),
    ];
  }

  @override
  List<Widget> getPages() {
    return [Home(), Home(), Home()];
  }

  @override
  void onNavTap(int index) {
    super.onNavTap(index);
    ///
    setToolbarTitle(getBarItems()[index].label);
  }
}
