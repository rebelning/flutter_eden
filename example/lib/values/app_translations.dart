import 'package:flutter_eden/eden.dart';

///
class AppTranslations extends EdenAppTranslations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          ...en_Keys,
          "helloworld": "hello world",
          "language_title": "switch Language",
          "switch_language": "switch Language",
        },
        'zh_CN': {
          ...zh_Keys,
          "helloworld": "你好 世界！",
          "language_title": "切换语言",
          "switch_language": "切换语言"
        },
      };
}
