import 'package:flutter_eden/eden.dart';

import 'modules/app_route.dart';
import 'modules/component_route.dart';
import 'modules/home_route.dart';

abstract class Routes {
  static final home = HomeRoute();
  static final app = AppRoute();
  static final component = ComponentRoute();
  static List<GetPage> getPages() {
    return [
      ...home.getRoutePages(),
      ...app.getRoutePages(),
      ...component.getRoutePages(),
    ];
  }
}
