import 'package:example/app/modules/home/controllers/home_controller.dart';
import 'package:example/app/modules/home/views/home_index.dart';
import 'package:flutter_eden/eden.dart';

class HomeRoute extends AbstractBaseRoute {
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
