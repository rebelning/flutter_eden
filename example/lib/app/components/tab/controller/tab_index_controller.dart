import 'package:flutter_eden/eden.dart';

class TabIndexController extends EdenBaseController {
  PageController? _pageController;
  PageController? get pageController => _pageController;
  TabController? _tabController;
  TabController? get tabController => _tabController;

  List<String>? _tabTitles;
  List<String>? get tabTitles => _tabTitles;

  @override
  void init() {
    _pageController = PageController(initialPage: 0);
    _tabTitles = [
      "Tab-0",
      "Tab-1",
      "Tab-2",
      "Tab-3",
      "Tab-4",
      "Tab-5",
    ];
  }

  void setTabController(TabController mTabController) {
    _tabController = mTabController;
  }

  void setTabIndex(int index) {
    tabController?.animateTo(index);
  }

  void setPageIndex(int index) {
    pageController?.animateToPage(index,
        duration: const Duration(microseconds: 200), curve: Curves.bounceInOut);
  }

  @override
  void dealloc() {}
}
