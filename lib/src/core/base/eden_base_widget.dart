import 'package:flutter_eden/eden.dart';
import 'mixin/eden_base_mixin.dart';

abstract class EdenBaseWidget<T extends EdenBaseController> extends GetWidget<T>
    with EdenBaseMixin<T> {
  EdenBaseWidget({super.key});

  @protected
  bool useScaffold() => false;
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
        return useScaffold()
            ? buildScaffold(context, controller)
            : buildCustomLayout(context, controller);
      },
    );
  }
}
