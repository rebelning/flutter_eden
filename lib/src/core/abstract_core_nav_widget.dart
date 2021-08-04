import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';

///abstract mvvm bottom navigation bar
abstract class AbstractCoreNavWidget extends AbstractCoreWidget {
  const AbstractCoreNavWidget({Key? key}) : super(key: key);
}

///
abstract class AbstractCoreNavWidgetState<T extends AbstractCoreNavWidget>
    extends AbstractCoreWidgetState<T> {
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
      // fixedColor: Theme.of(context).primaryColor,
    );
  }
}
