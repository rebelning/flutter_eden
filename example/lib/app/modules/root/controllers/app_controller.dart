import 'package:flutter_eden/eden.dart';

class AppController extends EdenNavBaseController {
  static AppController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    print("App onInit ...");
  }

  @override
  void onClose() {
    super.onClose();
    print("App onClose ...");
  }

  @override
  void dealloc() {}

  @override
  Future doRequest(bool isPull) {
    throw UnimplementedError();
  }

  @override
  void init() {}
}
