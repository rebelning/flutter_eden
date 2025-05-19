import 'package:flutter_eden/eden.dart';

mixin EdenRefreshableMixin<T extends EdenBaseListController> {
  @protected
  Widget renderHeadView(BuildContext context) {
    return const SizedBox.shrink();
  }

  Widget buildListView(BuildContext context, T controller);

  @protected
  Widget buildRefreshableList(BuildContext context, T controller) {
    debugPrint(
        "buildRefreshableList controller.refreshController=${controller.refreshController.hashCode}");
    return SmartRefresher(
      controller: controller.refreshController,
      enablePullDown: controller.enablePullDown,
      enablePullUp: controller.isNext(),
      onRefresh: () {
        controller.onRefresh();
      },
      onLoading: () {
        controller.onLoading();
      },
      child: buildListView(context, controller),
    );
  }
}
