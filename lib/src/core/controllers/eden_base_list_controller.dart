import 'package:flutter_eden/eden.dart';

///ListView controller
abstract class EdenBaseListController extends EdenBaseController {
  // final RefreshController _refreshController = RefreshController();
  late RefreshController _refreshController;

  RefreshController get refreshController => _refreshController;
  int _pageSize = 10;
  int get pageSize => _pageSize;
  int _pageIndex = 1;
  int get pageIndex => _pageIndex;
  bool _isNext = false;

  bool _enablePullDown = true;

  bool get enablePullDown => _enablePullDown;

  @override
  void init() {}

  void setNext(bool hasNext) {
    _isNext = hasNext;
  }

  void setPageSize(int size) {
    _pageSize = size;
  }

  bool isNext() {
    return _isNext;
  }

  void setEnablePull(bool enablePullDown) {
    _enablePullDown = enablePullDown;
  }

  void requestRefresh() {
    refreshController.requestRefresh();
  }

  ///
  void onRefresh() async {
    // monitor network fetch

    _pageIndex = 1;

    await doRequest(true);

    await Future.delayed(const Duration(seconds: 1));
    refreshController.refreshCompleted();
  }

  ///
  void onLoading() async {
    // monitor network fetch

    await doRequest(false);

    await Future.delayed(const Duration(seconds: 1));
    refreshController.loadComplete();
  }
}
