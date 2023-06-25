import 'package:flutter_eden/eden.dart';

// ignore: must_be_immutable
abstract class EdenBaseListWidget<T extends EdenBaseListController>
    extends EdenBaseWidget<T> {
  EdenBaseListWidget({Key? key}) : super(key: key);

  ///body view
  Widget buildListView(BuildContext context, T _controller);

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
            controller: controller.refreshController,
            onRefresh: () {
              controller.onRefresh();
            },
            onLoading: () {
              controller.onLoading();
            },
            primary: false,
            child: buildListView(context, _controller),
          ),
        ),
      ],
    );
  }
}
