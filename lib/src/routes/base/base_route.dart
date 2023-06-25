import 'package:get/get.dart';

abstract class BaseRoute {
  ///prefix
  String get prefix;

  ///Getpage
  List<GetPage> getRoutePages();
}
