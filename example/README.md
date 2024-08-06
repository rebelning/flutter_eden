# example

sparrow flutter framework example.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## 国际化

###### 1,在assets/lang下面创建语言文件

###### 2,在main函数中加载当前语言文件

```
//动态加载国际化资源文件
  WidgetsFlutterBinding.ensureInitialized();
  final appTranslations = AppTranslations();
  if (kDebugMode) {
    print(
        "-----main--languageCode---${Get.deviceLocale?.languageCode}---countryCode-${Get.deviceLocale?.countryCode}");
  }
  final localStr =
      "${Get.deviceLocale?.languageCode}_${Get.deviceLocale?.countryCode}";
  await appTranslations.loadTranslations(localStr);
```

###### 3, 切换语言的时候，动态更新语言文件

```
  //切换语言的地方可以
  Locale locale = const Locale('zh', 'CN');
  final localStr = "${locale.languageCode}_${locale.countryCode}";
  await appTranslations().loadTranslations(localStr);
  Get.updateLocale(locale);
```