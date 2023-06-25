import 'package:flutter_eden/eden.dart';

class DialogDemoController extends EdenBaseController {
  static DialogDemoController get to => Get.find();
  final String? tag;
  DialogDemoController({this.tag});

  @override
  void onReady() {
    super.onReady();
    print("onReady...");
  }

  @override
  void onInit() {
    super.onInit();
    print("dialog demo onInit...");
    print("tag-$tag");
  }

  @override
  void onClose() {
    super.onClose();
    print("dialog demo onClose...");
  }

  @override
  void dealloc() {}

  @override
  Future doRequest(bool isPull) async {}

  @override
  void init() {}
}
