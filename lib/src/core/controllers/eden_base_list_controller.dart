import 'dart:async';

import 'package:flutter_eden/eden.dart';

///ListView controller
abstract class EdenBaseListController extends EdenBaseController {
  RefreshController? refreshController;

  // RefreshController get refreshController => _refreshController;

  RefreshController getRefreshController();

  bool _isNext = false;

  final bool _enablePullDown = true;

  bool get enablePullDown => _enablePullDown;
  void setNext(bool hasNext) {
    _isNext = hasNext;
  }

  bool isNext() {
    return _isNext;
  }

  @override
  void init() {}

  Future onRefresh() async {
    await doRequest(true);
    refreshController?.refreshCompleted();
    update();
  }

  Future onLoading() async {
    await doRequest(false);
    refreshController?.loadComplete();
    update();
  }

  @override
  void dealloc() {
    refreshController?.dispose();
  }
}
