import 'package:flutter_eden/eden.dart';

abstract class EdenBaseController extends GetxController {
  bool? _isRequest = false;

  bool? get isRequest => _isRequest;

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

  void init();
  void dealloc();
  Future doRequest(bool isPull) async {}

  void hideKeyboard() {
    FocusScope.of(kContext!).requestFocus(FocusNode());
  }

  ///
  S edenFind<S>({String? tag}) => Get.find<S>(tag: tag);
}
