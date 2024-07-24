import 'dart:convert';

import 'package:flutter_eden/eden.dart';

class EdenAppTranslations extends Translations {
  final Map<String, Map<String, String>> _translations = {};

  Map<String, String> get en_Keys => {
        'loading': 'loading...',
        "uploaded": "upload completed",
        "uploading": "uploading",
      };
  Map<String, String> get zh_Keys => {
        'loading': '加载中...',
        "uploaded": "上传完成",
        "uploading": "上传中",
      };

  Future<void> loadTranslations(String locale) async {
    Map<String, String>? tran = _translations[locale];

    if (tran == null) {
      try {
        String jsonContent =
            await rootBundle.loadString('assets/lang/$locale.json');
        Map<String, String> translations =
            Map<String, String>.from(json.decode(jsonContent));

        _translations.clear();
        _translations[locale] = translations;

        Get.clearTranslations();
        Get.addTranslations(_translations);
      } catch (e) {
        print("------loadTranslations error:$e");
      }
    }
  }

  @override
  Map<String, Map<String, String>> get keys => _translations;
}
