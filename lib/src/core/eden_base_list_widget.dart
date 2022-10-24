import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_eden/eden.dart';

abstract class EdenBaseListWidget<T extends EdenBaseListController>
    extends EdenBaseWidget<T> {
  EdenBaseListWidget({Key? key}) : super(key: key);

  ///body view
  Widget buildListView(BuildContext context, T _controller);

  void requestRefresh() {
    controller.refreshController?.requestRefresh();
  }

  ///
  void _onRefresh() async {
    // monitor network fetch

    controller.pageIndex = 1;

    await controller.doRequest(true);

    await Future.delayed(const Duration(seconds: 1));
    controller.refreshController?.refreshCompleted();
  }

  ///
  void _onLoading() async {
    // monitor network fetch

    await controller.doRequest(false);

    await Future.delayed(const Duration(seconds: 1));
    controller.refreshController?.loadComplete();
  }

  void getPageIndex(String? hasNext) {
    try {
      if (hasNext == null || hasNext == "") {
        controller.pageIndex = 1;
        controller.setNext(false);
      } else {
        Uri uri = Uri.parse(hasNext);
        String? page = uri.queryParameters["page"];
        if (page != null && page != "") {
          controller.pageIndex = int.parse(page);
          controller.setNext(true);
        }
      }
    } catch (e) {}
  }

  ///

  ///
  void setPageSize(int size) {
    controller.pageSize = size;
  }

  ///topView
  Widget renderHeadView(BuildContext context) {
    return Container();
  }

  @override
  Widget buildBody(BuildContext context, T _controller) {
    return Column(
      children: [
        renderHeadView(context), //topView
        Expanded(
          child: SmartRefresher(
            enablePullDown: controller.enablePull,
            enablePullUp: controller.isNext(),
            controller: controller.refreshController ??
                RefreshController(initialRefresh: false),
            onRefresh: () {
              _onRefresh();
            },
            onLoading: () {
              _onLoading();
            },
            primary: false,
            child: buildListView(context, _controller),
          ),
        ),
      ],
    );
  }
}
