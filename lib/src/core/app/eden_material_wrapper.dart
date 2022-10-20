import 'package:flutter/cupertino.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flutter_eden/src/core/logger/eden_logger.dart';
import 'package:flutter_eden/src/plugin/eden_plugin.dart';

class EdenMaterialWrapper extends StatelessWidget {
  final bool? enableLog;
  final Size? designSize;
  final GetPage? unknownRoute;
  final List<GetPage>? getPages;
  final String? initialRoute;
  final Widget? home;
  final ThemeData? theme;
  final Bindings? initialBinding;
  final TransitionBuilder? splashBuilder;
  final ValueChanged<Routing?>? routingCallback;
  const EdenMaterialWrapper({
    Key? key,
    this.enableLog,
    this.home,
    this.initialRoute,
    this.theme,
    this.getPages,
    this.designSize,
    this.unknownRoute,
    this.initialBinding,
    this.splashBuilder,
    this.routingCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EdenLayoutWrapper(
      designSize: designSize ?? EdenLayoutUtils.designSize,
      builder: (context, child) {
        return RefreshConfiguration(
          headerBuilder: () => Theme(
              data: Theme.of(context).copyWith(
                cupertinoOverrideTheme: const CupertinoThemeData(
                  brightness: Brightness.light,
                ),
              ),
              child: const WaterDropHeader()),
          // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
          footerBuilder: () => const ClassicFooter(),
          // 配置默认底部指示器
          headerTriggerDistance: 80,
          // 头部触发刷新的越界距离
          springDescription:
              const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
          // 自定义回弹动画,三个属性值意义请查询flutter api
          maxOverScrollExtent: 100,
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
        defaultTransition: Transition.cupertino,
        // opaqueRoute: Get.isOpaqueRouteDefault,
        // popGesture: Get.isPopGestureEnable,
        getPages: getPages ?? [],
        // initialRoute: Routes.app.root,
        unknownRoute: unknownRoute,
        // home: AppComponent(),
        home: home,
        initialRoute: initialRoute,
        logWriterCallback: Logger.edenWrite,
        routingCallback: routingCallback,
        theme: theme ?? EdenThemeData.darkThemeData(),
        initialBinding: initialBinding,

        navigatorObservers: [BotToastNavigatorObserver()],
        localizationsDelegates: const [
          RefreshLocalizations.delegate,
        ],
        builder: (BuildContext context, Widget? child) {
          final botToastBuilder = BotToastInit();
          child = botToastBuilder(context, child);

          return splashBuilder == null ? child : splashBuilder!(context, child);
        },
      );
}
