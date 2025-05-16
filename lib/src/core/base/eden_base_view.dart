import 'package:flutter_eden/eden.dart';
import 'package:flutter_eden/src/core/base/mixin/eden_base_view_mixin.dart';
import 'mixin/eden_base_mixin.dart';

///
abstract class EdenBaseView<T extends EdenBaseController> extends GetView<T>
    with EdenBaseMixin<T>, EdenBaseViewMixin<T> {
  EdenBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      init: controller,
      initState: onInitState,
      dispose: onDispose,
      didChangeDependencies: didChangeDependencies,
      didUpdateWidget: didUpdateWidget,
      tag: getViewTag(),
      builder: (controller) {
        return buildScaffold(context, controller);
      },
    );
  }
}

///
abstract class EdenBaseWidget<T extends EdenBaseController> extends GetWidget<T>
    with EdenBaseMixin<T>, EdenBaseViewMixin<T> {
  EdenBaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      init: controller,
      initState: onInitState,
      dispose: onDispose,
      didChangeDependencies: didChangeDependencies,
      didUpdateWidget: didUpdateWidget,
      tag: getViewTag(),
      builder: (controller) {
        return useScaffold()
            ? buildScaffold(context, controller)
            : buildCustomLayout(context, controller);
      },
    );
  }
}
