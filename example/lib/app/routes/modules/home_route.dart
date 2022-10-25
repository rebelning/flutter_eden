import 'package:example/app/modules/root/home/controllers/home_controller.dart';
import 'package:example/app/modules/root/home/views/home_index.dart';
import 'package:flutter_eden/eden.dart';

class HomeRoute extends EdenBaseRoute {
  @override
  String get prefix => "/home";

  String get home => prefix;

  @override
  List<GetPage> getRoutePages() {
    return [
      routePage(
          name: home,
          page: () => HomeIndex(),
          bindingsBuilder: () {
            Get.lazyPut(() => HomeController());
          })
    ];
  }
}
