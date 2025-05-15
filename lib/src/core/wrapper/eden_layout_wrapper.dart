import 'package:flutter_eden/eden.dart';
import 'dart:ui' show window;

import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 物理屏幕，物理像素，它的size可以通过[window.physicalSize]获得，比如iPhone11 Pro的宽高是1125 * 2436
/// 逻辑屏幕，逻辑像素，
/// 设备像素比devicePixelRatio，通过[window.devicePixelRatio]获得
/// 自定义屏幕适配器，我们自定义的屏幕，

extension SizeExtensionRPX on num {
  double get rpx => ScreenUtil().setWidth(this);
}

class EdenLayoutUtils {
  // 我们自己设定的虚拟屏幕宽度750
  static double get customScreenWidth => 750.0;
  static double get customScreenRatio => physicalSize.width / customScreenWidth;

  static Size get designSize => Size(
        EdenLayoutUtils.customScreenWidth,
        EdenLayoutUtils.physicalSize.height / EdenLayoutUtils.customScreenRatio,
      );

  /// 屏幕高度
  static double get screenHeight => ScreenUtil().screenHeight;

  /// 获得顶部导航栏AppBar的高度 56
  static double get appBarHeight => kToolbarHeight;

  /// 获得底部导航栏的高度 56
  static double get bottomNavigationBarHeight => kBottomNavigationBarHeight;

  /// 状态栏高度 SafeArea上面、顶部导航栏上面
  static double get statusBarHeight => ScreenUtil().statusBarHeight;

  /// 底部栏高度 SafeArea下面、底部导航栏下面（ScreenUtil定义有问题，需要单独除以ratio）
  static double get bottomBarHeight =>
      ScreenUtil().bottomBarHeight / (ScreenUtil().pixelRatio ?? 1);

  /// 安全区域高度
  static double get safeAreaHeight =>
      ScreenUtil().screenHeight - statusBarHeight - bottomBarHeight;

  /// 屏幕物理像素
  static Size get physicalSize =>
      PlatformDispatcher.instance.implicitView!.physicalSize;

  /// 默认 逻辑像素dp
  static Size screenSize() => Size(
        physicalSize.width /
            PlatformDispatcher.instance.implicitView!.devicePixelRatio,
        physicalSize.height /
            PlatformDispatcher.instance.implicitView!.devicePixelRatio,
      );

  /// 其他的数值
  ///
  /// barHeight，使用位置：
  /// 1.固定在底部的bar，比如包含两个按钮（取消、确定）的那种。
  /// 2.AppBar下面筛选、排序的bar
  /// 3.SidebarList左侧导航每条的高度
  static double get barHeight => 88.rpx;
}

class EdenLayoutWrapper extends StatelessWidget {
  /// A helper widget that initializes [ScreenUtil]
  final Widget Function(
    BuildContext context,
    Widget? child,
  ) builder;

  /// The [Size] of the device in the design draft, in dp
  final Size designSize;
  const EdenLayoutWrapper({
    required this.builder,
    this.designSize = ScreenUtil.defaultSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      key: key,
      designSize: designSize,
      builder: builder,
    );
  }
}
