import 'package:example/app/components/page/controllers/demo_controller.dart';
import 'package:flutter_eden/eden.dart';

class DemoBinding extends Bindings {
  final String? tag;
  DemoBinding({@required this.tag});
  @override
  void dependencies() {
    Get.lazyPut(() => DemoController(tag: tag), tag: tag);
  }
}
