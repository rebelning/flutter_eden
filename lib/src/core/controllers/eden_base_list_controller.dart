import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_eden/eden.dart';

///ListView controller
abstract class EdenBaseListController extends EdenBaseController {
  late final RefreshController _refreshController =
      RefreshController(initialRefresh: enablePull);

  RefreshController get refreshController => _refreshController;
  int pageSize = 10;
  int pageIndex = 1;
  bool _isNext = false;

  bool _enablePull = true;

  bool get enablePull => _enablePull;

  @override
  void init() {}

  void setNext(bool hasNext) {
    _isNext = hasNext;
  }

  bool isNext() {
    return _isNext;
  }

  void setEnablePull(bool enablePull) {
    _enablePull = enablePull;
  }
}
