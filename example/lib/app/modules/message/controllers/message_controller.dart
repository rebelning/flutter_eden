import 'package:flutter_eden/eden.dart';

class MessageController extends EdenBaseController {
  static MessageController get to => Get.find();
  String? _title;
  String? get title => _title;
  @override
  void onInit() {
    super.onInit();
    print("message onInit...");
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
