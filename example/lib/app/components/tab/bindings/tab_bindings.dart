import 'package:example/app/components/tab/children/controller/tab_info_controller.dart';
import 'package:example/app/components/tab/controller/tab_index_controller.dart';

import 'package:flutter_eden/eden.dart';

///
class TabBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabIndexController());
    Get.lazyPut(() => TabInfoController());
  }
}
