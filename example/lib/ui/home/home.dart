import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_eden/eden.dart';

class Home extends AbstractMvvmKLiveBase {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends AbstractMvvmKLiveBaseState<Home>{
  // @override
  // bool get wantKeepAlive => true;

  @override
  bool getHideToolbar() {
    return false;
  }

  @override
  bool getHideToolbarArrowBack() {
    return true;
  }

  @override
  String getToolbarTitle() {
    return "Home";
  }

  @override
  Widget buildBody(BuildContext context) {
   Size size= window.physicalSize;
   // mediaQuery.devicePixelRatio
  final ratio= MediaQuery.of(context).devicePixelRatio;
    DebugLog.log("physicalSize.width", size.width.toString());
    DebugLog.log("devicePixelRatio", ratio.toString());
    ////  ///设计图720*1280
   //   /// 720*1280 为例  1.5   1080*1920  1920/1.5 =1280
    return Center(
      child: TextWidget(text: 'home...'),
    );
  }


}
