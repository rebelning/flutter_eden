import 'package:flutter/material.dart';
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

  /// ScreenUtil要求在首页进行初始化操作
  /// 设定宽度为750，计算相应高度
  /// 以iPhone11举例
  /// 物理像素 828 * 1792
  /// 逻辑像素 414 * 896
  /// 像素比 2
  ///
  /// 自定义逻辑像素 750 * 1623.19

  /// iPhone 8 plus
  /// 物理像素 1242 * 2208  为什么官网写的是1920*1080呢？
  /// 逻辑像素 414 * 736
  /// 像素比 3
  /// 自定义逻辑像素 750 * 1333.333
  ///
  ///
  /// 初始化函数，
  ///
  /// ScreenUtil最初需要在MaterialApp中初始化，使用[MediaQuery]，需要调用context，
  /// 这样我们不能在定义主题的时候使用rpx设置字体大小。
  /// 2.2.0版本改成了使用[window]中的属性，获得屏幕大小进行初始化。
  /// 2.3.0版本后面又改回了使用[MediaQuery]，好像是在某某情况下window获得的屏幕大小不准确
  /// 4.0.3+1版本，使用[ScreenUtilInit]包裹MaterialApp进行初始化

  //////// 下面的单位都是使用dp (手机默认的逻辑像素) //////////

  /// 屏幕从上至下可能包括：
  /// statusBar 状态栏
  /// AppBar topNavigationBar 顶部导航
  /// 页面主体
  /// bottomNavigationBar底部导航
  /// bottomBar（iPhoneX+底部的部分，普通手机此部分高度为0）
  ///
  /// Flutter中的SafeArea是屏幕排除状态栏和bottomBar
  ///
  /// 系统默认的底部导航栏的高度不是[bottomNavigationBarHeight]和[bottomBarHeight]相加
  /// 而是 这俩值的和 再减去选中文字大小的一半。所以略小

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
  static Size get physicalSize => window.physicalSize;

  /// 默认 逻辑像素dp
  static Size screenSize() => Size(
        physicalSize.width / window.devicePixelRatio,
        physicalSize.height / window.devicePixelRatio,
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      key: key,
      designSize: designSize,
      builder: builder,
    );
  }
}
