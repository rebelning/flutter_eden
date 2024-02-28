import 'package:flutter_eden/eden.dart';
import 'package:flutter_eden/src/net/proxy/eden_proxy_provider.dart';

///
abstract class EdenBaseBindings extends Bindings {
  ///
  void edenDependencies();

  ///
  @override
  void dependencies() {
    Get.put(() => EdenProxyProvider());
    edenDependencies();
  }
}
