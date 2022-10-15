import 'package:get/get.dart';

import 'base_route.dart';

///base route
abstract class AbstractBaseRoute implements BaseRoute {
  ///
  GetPage routePage<T>({
    required String name,
    required GetPageBuilder page,
    required Function bindingsBuilder,
    bool? preventDuplicates,
    List<GetMiddleware>? middlewares,
    List<GetPage<dynamic>>? children,
    Transition? transition,
  }) {
    return GetPage<T>(
      name: name,
      page: page,
      preventDuplicates: preventDuplicates ?? true,
      binding: BindingsBuilder(() {
        bindingsBuilder();
      }),
      middlewares: middlewares,
      children: children ?? [],
      transition: transition ?? Transition.cupertino,
    );
  }
}
