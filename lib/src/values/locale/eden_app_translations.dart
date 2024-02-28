import 'package:flutter_eden/eden.dart';

class EdenAppTranslations extends Translations {
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

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          ...en_Keys,
          // 'loading': 'loading...',
        },
        'zh_CN': {
          // 'loading': '加载中...',
          ...zh_Keys,
        },
      };
}
