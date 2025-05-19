import 'package:flutter_eden/eden.dart';
import 'mixin/eden_refreshable_mixin.dart';

///
abstract class EdenBaseListView<T extends EdenBaseListController>
    extends EdenBaseView<T> with EdenRefreshableMixin<T> {
  EdenBaseListView({super.key});

  @override
  Widget buildListView(BuildContext context, T controller);

  @override
  Widget buildBody(BuildContext context, T controller) {
    return buildRefreshableList(context, controller);
  }
}

///
abstract class EdenBaseListWidget<T extends EdenBaseListController>
    extends EdenBaseWidget<T> with EdenRefreshableMixin<T> {
  EdenBaseListWidget({super.key});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Widget buildListView(BuildContext context, T controller);

  @override
  Widget buildBody(BuildContext context, T controller) {
    return buildRefreshableList(context, controller);
  }
}
