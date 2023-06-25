import 'package:example/app/components/button/controllers/demo_button_controller.dart';
import 'package:example/app/components/button/view/demo_button_page.dart';
import 'package:example/app/components/dialog/controllers/dialog_demo_controller.dart';
import 'package:example/app/components/dialog/view/dialog_demo_page.dart';
import 'package:example/app/components/page/controllers/demo_controller.dart';
import 'package:example/app/components/page/view/demo_page.dart';
import 'package:flutter_eden/eden.dart';

class ComponentRoute extends EdenBaseRoute {
  @override
  String get prefix => "/components";

  String get dialog => prefix + "/dialog";
  String get page => prefix + "/page";
  String get buttonView => prefix + "buttonView";

  @override
  List<GetPage> getRoutePages() {
    return [
      routePage(
        name: dialog,
        preventDuplicates: false,
        page: () => DialogDemoPage(),
        bindingsBuilder: () {
          Get.lazyPut(() => DialogDemoController());
        },
      ),
      routePage(
        name: page,
        preventDuplicates: false,
        page: () => DemoPage(),
        // bindings: [
        //   DemoBinding(tag: 'demo'),
        // ],
        bindingsBuilder: () {
          Get.lazyPut(() => DemoController(tag: "tag/1"));
        },
      ),
      routePage(
        name: buttonView,
        page: () => DemoButtonPage(),
        bindingsBuilder: () {
          Get.lazyPut(() => DemoButtonController());
        },
      ),
    ];
  }
}
