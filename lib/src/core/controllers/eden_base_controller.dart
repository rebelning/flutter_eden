import 'package:flutter_eden/eden.dart';

abstract class EdenBaseController extends GetxController {
  final bool? _isRequest = false;

  bool? get isRequest => _isRequest;

  @override
  void onInit() {
    super.onInit();
    init();
    if (isRequest == true) {
      showLoading(doRequest(true));
    }
  }

  @override
  void onClose() {
    super.onClose();
    dealloc();
  }

  @protected
  void init();
  @protected
  void dealloc();
  @protected
  Future doRequest(bool isPull) async {}
  @protected
  void hideKeyboard() {
    FocusScope.of(kContext!).requestFocus(FocusNode());
  }

  ///
  @protected
  S edenFind<S>({String? tag}) => Get.find<S>(tag: tag);
  @protected
  Future futureDelayed(
    Future computation, {
    int seconds = 1,
  }) {
    return Future.delayed(
        Duration(
          seconds: seconds,
        ),
        () => computation);
  }
}
