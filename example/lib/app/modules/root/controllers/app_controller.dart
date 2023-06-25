import 'package:flutter_eden/eden.dart';

class AppController extends EdenBaseController {
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
  void dealloc() {
    // TODO: implement dealloc
  }

  @override
  Future doRequest(bool isPull) {
    // TODO: implement doRequest
    throw UnimplementedError();
  }

  @override
  void init() {
    // TODO: implement init
  }
}
