import 'package:flutter_eden/eden.dart';

abstract class IProxyProvider {}

///
class EdenProxyProvider extends EdenBaseProvider implements IProxyProvider {
  @override
  void onInit() {
    super.onInit();
    print("EdenProxyProvider init...");
  }

  @override
  bool? needToken() {
    return false;
  }

  @override
  bool? isCustomResp() {
    return false;
  }
}
