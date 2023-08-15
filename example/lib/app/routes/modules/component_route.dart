import 'package:example/app/components/button/controllers/demo_button_controller.dart';
import 'package:example/app/components/button/view/demo_button_page.dart';
import 'package:example/app/components/dialog/controllers/dialog_demo_controller.dart';
import 'package:example/app/components/dialog/view/dialog_demo_page.dart';
import 'package:example/app/components/page/controllers/demo_controller.dart';
import 'package:example/app/components/page/view/demo_page.dart';
import 'package:example/app/components/tab/bindings/tab_bindings.dart';
import 'package:example/app/components/tab/children/controller/tab_info_controller.dart';
import 'package:example/app/components/tab/children/view/tab_info_view.dart';
import 'package:example/app/components/tab/controller/tab_index_controller.dart';
import 'package:example/app/components/tab/view/tab_index_page.dart';
import 'package:flutter_eden/eden.dart';

class ComponentRoute extends EdenBaseRoute {
  @override
  String get prefix => "/components";

  String get dialog => prefix + "/dialog";
  String get page => prefix + "/page";
  String get buttonView => prefix + "/buttonView";

  ///tab index page
  String get tabIndex => prefix + "/tabIndex";

  @override
  List<GetPage> getRoutePages() {
    return [
      routePage(
        name: dialog,
        preventDuplicates: false,
        page: () => DialogDemoPage(),
        bindingsBuilder: () {
          edenLazyPut(() => DialogDemoController());
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
          edenLazyPut(() => DemoController(tag: "tag/1"));
        },
      ),
      routePage(
        name: buttonView,
        page: () => DemoButtonPage(),
        bindingsBuilder: () {
          edenLazyPut(() => DemoButtonController());
        },
      ),
      routePage(
        name: tabIndex,
        page: () => TabIndexPage(),
        bindings: [
          TabBindings(),
        ],
        children: [
          routePage(
              name: tabIndex + "/tabInfo",
              page: () => TabInfoView(),
              bindingsBuilder: () {
                // edenLazyPut(() => TabInfoController());
              }),
        ],
        bindingsBuilder: () {
          // edenLazyPut(() => TabIndexController());
        },
      ),
    ];
  }
}
