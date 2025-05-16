import 'package:flutter_eden/eden.dart';

mixin EdenBaseViewMixin<T extends EdenBaseController> {
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
}
