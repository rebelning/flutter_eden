import 'package:flutter_eden/eden.dart';

abstract class EdenNavBaseController extends EdenBaseController {
  final PageController _pageController = PageController();
  PageController get pageController => _pageController;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void onNavTap(int index) {
    _currentIndex = index;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleOnChange(index);
      update();
    });
  }

  void _handleOnChange(int index) {
    _pageController.jumpToPage(index);
  }
}
