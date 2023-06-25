import 'package:flutter_eden/eden.dart';

class ConfigService extends EdenBaseService {
  @override
  void onInit() {
    super.onInit();

    EdenHttpHook.setError((value) {
      print("httpHook-error=$value");

      // EdenSnackbar("${value?.toString()}", title: "Error");
    });
  }

  Future<ConfigService> init() async {
    print("ConfigService init..");
    await EdenHttpHook.setHttpProxy();
    return this;
  }
}
