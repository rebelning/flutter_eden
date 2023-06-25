import 'package:flutter_eden/eden.dart';

///ListView controller
abstract class EdenBaseListController extends EdenBaseController {
  final RefreshController _refreshController = RefreshController();

  RefreshController get refreshController => _refreshController;
  int _pageSize = 10;
  int get pageSize => _pageSize;
  int _pageIndex = 1;
  int get pageIndex => _pageIndex;
  bool _isNext = false;

  bool _enablePull = true;

  bool get enablePull => _enablePull;

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

  void setEnablePull(bool enablePull) {
    _enablePull = enablePull;
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

  void getPageIndex(String? hasNext) {
    try {
      if (hasNext == null || hasNext == "") {
        _pageIndex = 1;
        setNext(false);
      } else {
        Uri uri = Uri.parse(hasNext);
        String? page = uri.queryParameters["page"];
        if (page != null && page != "") {
          _pageIndex = int.parse(page);
          setNext(true);
        }
      }
    } catch (e) {}
  }
}
