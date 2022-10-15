import 'package:flutter_eden/eden.dart';

abstract class EdenNavBaseWidget<T extends EdenBaseController>
    extends EdenBaseWidget<T> {
  final _pageController = PageController();
  int _currentIndex = 0;

  ///page list
  List<Widget> renderPages();

  List<BottomNavigationBarItem> renderBarItems();
  void onNavTap(int index) {
    _currentIndex = index;
    _handleOnChange(index);
    controller.update();
  }

  void _handleOnChange(int index) {
    _pageController.jumpToPage(index);
  }

  ///build body
  @override
  Widget buildBody(BuildContext context, T contoller) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: renderPages(),
    );
  }

  @override
  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      items: renderBarItems(),
      currentIndex: _currentIndex,
      onTap: onNavTap,
      type: BottomNavigationBarType.fixed,
      // fixedColor: Theme.of(context).primaryColor,
    );
  }
}
