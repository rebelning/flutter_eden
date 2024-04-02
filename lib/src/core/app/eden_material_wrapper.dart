import 'package:flutter_eden/eden.dart';
import 'package:flutter_eden/src/core/logger/eden_logger.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class EdenMaterialWrapper extends StatelessWidget {
  final bool? enableLog;
  final bool? debugShowCheckedModeBanner;
  final String? logTag;
  final Widget? home;
  final String? initialRoute;
  // final List<GetPage>? getPages;
  final List<GetPage>? Function()? onGetPages;
  final GetPage? unknownRoute;
  final Size? designSize;
  final ThemeData? cupertinoThemeData;
  final ThemeData? Function()? onTheme;
  final Bindings? initialBinding;
  final TransitionBuilder? splashBuilder;
  final Iterable<Locale>? supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Translations? translations;
  final Locale? locale;
  final Locale? fallbackLocale;
  final ValueChanged<Routing?>? routingCallback;
  final GlobalKey<NavigatorState>? navigatorKey;
  const EdenMaterialWrapper({
    Key? key,
    this.enableLog,
    this.debugShowCheckedModeBanner,
    this.logTag,
    this.home,
    this.initialRoute,
    this.designSize,
    this.unknownRoute,
    this.onGetPages,
    this.cupertinoThemeData,
    this.onTheme,
    this.initialBinding,
    this.splashBuilder,
    this.supportedLocales,
    this.localizationsDelegates,
    this.translations,
    this.locale,
    this.fallbackLocale,
    this.routingCallback,
    this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EdenLayoutWrapper(
      designSize: designSize ?? EdenLayoutUtils.designSize,
      builder: (context, child) {
        return RefreshConfiguration(
          headerBuilder: () => Theme(
              data: cupertinoThemeData ??
                  Theme.of(context).copyWith(
                    cupertinoOverrideTheme: const CupertinoThemeData(
                      brightness: Brightness.light,
                    ),
                  ),
              child: const WaterDropHeader()),
          // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
          footerBuilder: () => const ClassicFooter(),
          // 配置默认底部指示器
          headerTriggerDistance: 80.rpx,
          // 头部触发刷新的越界距离
          springDescription:
              SpringDescription(stiffness: 170.rpx, damping: 16, mass: 1.9),
          // 自定义回弹动画,三个属性值意义请查询flutter api
          maxOverScrollExtent: 100.rpx,
          //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
          maxUnderScrollExtent: 0,
          // 底部最大可以拖动的范围
          enableScrollWhenRefreshCompleted: true,
          //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
          enableLoadingWhenFailed: true,
          //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
          hideFooterWhenNotFull: false,
          // Viewport不满一屏时,禁用上拉加载更多功能
          enableBallisticLoad: true,
          child: materialApp,
        );
      },
    );
  }

  ///
  Widget get materialApp => GetMaterialApp(
        enableLog: enableLog ?? true,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner ?? true,
        navigatorKey: navigatorKey,
        defaultTransition: Transition.cupertino,
        home: home,
        initialRoute: initialRoute,
        getPages: onGetPages == null ? [] : onGetPages!(),
        unknownRoute: unknownRoute,
        // theme: theme ?? EdenThemeData.darkThemeData(),
        theme: onTheme == null ? EdenThemeData.darkThemeData() : onTheme!(),
        initialBinding: initialBinding,
        logWriterCallback: (String text, {bool isError = false}) {
          return Logger.edenWrite(text, logTag: logTag, isError: isError);
        },
        routingCallback: routingCallback ??
            (route) {
              closeAllSnackbars();
            },
        navigatorObservers: [BotToastNavigatorObserver()],
        localizationsDelegates: [
          ...localizationsDelegates ?? [],
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          RefreshLocalizations.delegate,
        ],
        supportedLocales: [
          ...supportedLocales ?? [],
          const Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hans',
            countryCode: 'CN',
          ),
        ],
        translations: translations ?? EdenAppTranslations(), // 使用你定义的本地化字符串
        locale: locale ?? const Locale('en', 'US'), //Locale('en', 'US') 默认的语言
        fallbackLocale: fallbackLocale ??
            const Locale('en', 'US'), // 当指定的语言没有提供本地化字符串时使用的备用语言
        builder: (BuildContext context, Widget? child) {
          final botToastBuilder = BotToastInit();
          child = botToastBuilder(context, child);
          final MediaQueryData data = MediaQuery.of(context);
          // return splashBuilder == null ? child : splashBuilder!(context, child);
          return MediaQuery(
            data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
            child:
                splashBuilder == null ? child : splashBuilder!(context, child),
          );
        },
      );
}
