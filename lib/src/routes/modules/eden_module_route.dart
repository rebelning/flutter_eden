import 'package:flutter_eden/eden.dart';

class EdenModuleRoute extends EdenBaseRoute {
  @override
  String get prefix => "/eden";
  String get proxySeting => prefix + "/proxySetting";
  @override
  List<GetPage> getRoutePages() {
    return [
      routePage(
          name: proxySeting,
          page: () => ProxySettingPage(),
          bindingsBuilder: () {})
    ];
  }
}
