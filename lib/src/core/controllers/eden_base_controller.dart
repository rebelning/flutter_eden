import 'package:flutter_eden/eden.dart';

abstract class EdenBaseController extends GetxController {
  bool? _isRequest = false;

  bool? get isRequest => _isRequest;

  void setRequest(bool? request) {
    _isRequest = request;
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
  Future doRequest(bool isPull);
}
