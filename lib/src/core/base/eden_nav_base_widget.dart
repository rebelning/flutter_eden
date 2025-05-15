import 'package:flutter_eden/eden.dart';

abstract class EdenNavBaseWidget<T extends EdenNavBaseController>
    extends EdenBaseWidget<T> {
  EdenNavBaseWidget({super.key});

  ///page list
  @protected
  List<Widget> renderPages();
  @protected
  TextStyle? selectedLabelStyle() => null;
  @protected
  TextStyle? unselectedLabelStyle() => null;
  @protected
  Color? selectedItemColor() => null;
  @protected
  Color? unselectedItemColor() => null;
  @protected
  IconThemeData? selectedIconTheme() => null;
  @protected
  Color? navBackgroundColor() => null;
  @protected
  List<BottomNavigationBarItem> renderBarItems();

  ///build body
  @override
  Widget buildBody(BuildContext context, T contoller) {
    return PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: renderPages(),
    );
  }

  @override
  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      items: renderBarItems(),
      selectedLabelStyle: selectedLabelStyle(),
      unselectedLabelStyle: unselectedLabelStyle(),
      selectedItemColor: selectedItemColor(),
      unselectedItemColor: unselectedItemColor(),
      selectedIconTheme: selectedIconTheme(),
      backgroundColor: navBackgroundColor(),
      currentIndex: controller.currentIndex,
      onTap: controller.onNavTap,
      type: BottomNavigationBarType.fixed,
      // fixedColor: Theme.of(context).primaryColor,
    );
  }
}
