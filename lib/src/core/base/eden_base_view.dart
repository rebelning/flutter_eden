import 'package:flutter_eden/eden.dart';
import 'mixin/eden_base_mixin.dart';

abstract class EdenBaseView<T extends EdenBaseController> extends GetView<T>
    with EdenBaseMixin<T> {
  EdenBaseView({super.key});
  @protected
  void onInitState(GetBuilderState<T> state) {}
  @protected
  void onDispose(GetBuilderState<T> dispose) {}
  @protected
  void didChangeDependencies(GetBuilderState<T> dispose) {}
  @protected
  void didUpdateWidget(
      GetBuilder<GetxController> controller, GetBuilderState<T> state) {}

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
