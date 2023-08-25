import 'package:flutter_eden/eden.dart';

class LocaleSwitchController extends EdenBaseController {
  @override
  void init() {}

  void switchLanguage() {
    Locale? locale;
    print("Get.locale?.countryCode=${Get.locale?.countryCode}");
    if (Get.locale?.countryCode == "CN") {
      locale = const Locale('en', 'US'); // 切换到英文
    } else {
      locale = const Locale('zh', 'CN'); // 切换到简体中文
    }
    Get.updateLocale(locale); // 切换到简体中文

    update();
  }

  @override
  void dealloc() {}
}
