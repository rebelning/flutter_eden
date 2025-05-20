import 'dart:async';

import 'package:flutter_eden/eden.dart';

///ListView controller
abstract class EdenBaseListController extends EdenBaseController {
  late RefreshController _refreshController;

  RefreshController get refreshController => _refreshController;

  @protected
  void initRefreshController() {
    _refreshController = RefreshController(
      initialRefresh: false,
      initialLoadStatus: LoadStatus.idle,
    );
    debugPrint(
        " initRefreshController hashCode: ${refreshController.hashCode}");
  }

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
  void init() {
    initRefreshController();
  }

  Future onRefresh() async {
    try {
      await doRequest(true);
      refreshController.refreshCompleted();
    } catch (e) {
      debugPrint("Refresh error: $e");
      refreshController.refreshFailed();
    } finally {
      update();
    }
  }

  Future onLoading() async {
    try {
      await doRequest(false);
      if (!isNext()) {
        refreshController.loadNoData();
      } else {
        refreshController.loadComplete();
      }
    } catch (e) {
      debugPrint("Loading error: $e");
      refreshController.loadFailed();
    } finally {
      update();
    }
  }

  @override
  void dealloc() {
    refreshController.dispose();
  }
}
