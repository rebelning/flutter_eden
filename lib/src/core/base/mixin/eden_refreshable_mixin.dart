import 'package:flutter_eden/eden.dart';

mixin EdenRefreshableMixin<T extends EdenBaseListController> {
  @protected
  Widget renderHeadView(BuildContext context) {
    return const SizedBox.shrink();
  }

  Widget buildListView(BuildContext context, T controller);

  @protected
  Widget buildRefreshableList(BuildContext context, T controller) {
    return Column(
      children: [
        Expanded(
          child: SmartRefresher(
            enablePullDown: controller.enablePullDown,
            enablePullUp: controller.isNext(),
            controller: controller.refreshController,
            onRefresh: () {
              controller.onRefresh();
            },
            onLoading: () async {
              controller.onLoading();
            },
            child: buildListView(context, controller),
          ),
        ),
      ],
    );
  }
}
