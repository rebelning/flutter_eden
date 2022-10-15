import 'package:example/app/components/dialog/controllers/dialog_demo_controller.dart';
import 'package:flutter_eden/eden.dart';

class DialogDemoBinding extends Bindings {
  final String? tag;
  DialogDemoBinding({@required this.tag});
  @override
  void dependencies() {
    print("dependencies....");
    Get.put(DialogDemoController(tag: tag), tag: "$tag");
  }
}
