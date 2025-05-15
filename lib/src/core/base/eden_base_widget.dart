import 'package:flutter_eden/eden.dart';
import 'mixin/eden_base_mixin.dart';

abstract class EdenBaseWidget<T extends EdenBaseController> extends GetWidget<T>
    with EdenBaseMixin<T> {
  EdenBaseWidget({super.key});

  @protected
  bool useScaffold() => false;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return useScaffold()
        ? buildScaffold(context, controller)
        : buildCustomLayout(context, controller);
  }
}
