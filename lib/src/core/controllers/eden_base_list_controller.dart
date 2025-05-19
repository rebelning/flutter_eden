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
    try {
      await doRequest(true);
      refreshController?.refreshCompleted(); // 确保调用
    } catch (e) {
      debugPrint("Refresh error: $e");
      refreshController?.refreshFailed(); // 刷新失败
    } finally {
      update(); // 通知 UI 更新
    }
  }

  Future onLoading() async {
    try {
      await doRequest(false);
      if (!isNext()) {
        refreshController?.loadNoData(); // 无更多数据
      } else {
        refreshController?.loadComplete(); // 加载完成
      }
    } catch (e) {
      debugPrint("Loading error: $e");
      refreshController?.loadFailed(); // 加载失败
    } finally {
      update(); // 通知 UI 更新
    }
  }

  @override
  void dealloc() {
    refreshController?.dispose();
  }
}
