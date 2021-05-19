import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';

///abstract mvvm bottom navigation bar
abstract class AbstractMVVMBaseNav extends AbstractMVVMBase {
  const AbstractMVVMBaseNav({Key key}) : super(key: key);
}

///
abstract class AbstractMVVMBaseNavState<T extends AbstractMVVMBaseNav>
    extends AbstractMVVMBaseState<T> {
  var _pageController = PageController();
  int _currentIndex = 0;

  void initBarItems() {}

  ///page list
  List<Widget> getPages();

  List<BottomNavigationBarItem> getBarItems();

  void onNavTap(int index) {
    _currentIndex = index;
    _handleOnChange(index);
    if (mounted) setState(() {});
  }

  void _handleOnChange(int index) {
    _pageController.jumpToPage(index);
  }

  ///build body
  @override
  Widget buildBody(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: getPages(),
    );
  }

  @override
  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      items: getBarItems(),
      currentIndex: _currentIndex,
      onTap: onNavTap,
      type: BottomNavigationBarType.fixed,
      fixedColor: Theme.of(context).primaryColor,
    );
  }
}
