import 'package:flutter_eden/eden.dart';

import 'modules/app_route.dart';
import 'modules/component_route.dart';

abstract class Routes {
  static final app = AppRoute();
  static final eden = EdenModuleRoute();
  static final component = ComponentRoute();
  static List<GetPage> getPages() {
    return [
      ...eden.getRoutePages(),
      ...app.getRoutePages(),
      ...component.getRoutePages(),
    ];
  }
}
