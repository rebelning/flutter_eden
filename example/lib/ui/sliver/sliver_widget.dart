import 'dart:math';

import 'package:example/domain/models/menu.dart';
import 'package:example/ui/components/item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_eden/eden.dart';

enum AppBarBehavior { normal, pinned, floating, snapping }

class SliverWidget {
  ScrollController _controller = ScrollController();

  ///
  double _appBarHeight = 0.0;
  double? screenWidth;
  double? screenHeight;
  double? imageWidth;
  double? imageHeight;
  double? _statusBarHeight = 50.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  // AppBarBehavior _appBarBehavior = AppBarBehavior.floating;
  double? height = 0;
  void _getScreenInfo(context) {
    _statusBarHeight = MediaQuery.of(context).padding.top;
    // DebugLog.log('status-height:', _statusBarHeight.toString());
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    imageWidth = screenWidth; // image width
    imageHeight = imageWidth! * 9 / 16.0; // image height4:3
    // DebugLog.log("imageWidth:", imageWidth.toString());
    // DebugLog.log('imageHeight:', imageHeight.toString());
  }

  void viewDealloc() {
    _controller.dispose();
  }

  void addController(VoidCallback scrollUp, VoidCallback scrollDown) {
    _controller.addListener(() {
      if (_controller.offset == 0) {
        //up
        scrollUp();
        // } else if (_controller.offset > _appBarHeight * 2) {
      } else if (_controller.offset > height!) {
        ///down
        scrollDown();
      }
    });

    // SchedulerBinding?.instance?.addPostFrameCallback((_) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final keyContext = globalKey.currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox;
        final pos = box.localToGlobal(Offset.zero);
        height = pos.dy + box.size.height;
        print("height=$height");
      }
    });
  }

  void arrowUp() {
    DebugLog.log("arrowDown", "");
    DebugLog.log("_controller.positions-1", "${_controller.positions.length}");
    DebugLog.log("_controller.positions-1-height",
        "${_controller.positions.elementAt(0).pixels}");

    DebugLog.log("_controller.offset", "${_controller.offset}");
    // _controller.jumpTo(0);
    _controller.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void arrowDown() {
    DebugLog.log("arrowUp", "");

    DebugLog.log("_controller.offset", "${_controller.offset}");
    //_controller.jumpTo(_appBarHeight * 2);
    _controller.animateTo(
      // _controller.offset == 0 ? _appBarHeight * 2 : _controller.offset,
      _controller.offset == 0 ? height! : _controller.offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  Widget sliverView(BuildContext context, bool? isArrowDown) {
    _getScreenInfo(context);
    this._appBarHeight = imageHeight! - _statusBarHeight!;
    return CustomScrollView(
      controller: _controller,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        _getHeadView(context, _appBarHeight),
        _sectionHeaderView(context),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getItem(context, index);
            },
            childCount: 50,
          ),
        ),
      ],
    );
  }

  GlobalKey globalKey = GlobalKey();

  ///head view
  Widget _getHeadView(BuildContext context, double heiget) {
    return SliverToBoxAdapter(
      child: Container(
        key: globalKey,
        padding: EdgeInsets.only(top: 300),
        //height: heiget * 2,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  ///section
  Widget _sectionHeaderView(BuildContext context) {
    return SliverPersistentHeader(
      pinned: _appBarBehavior == AppBarBehavior.pinned,
      floating: false,
      delegate: _SliverAppBarDelegate(
          minHeight: 50.0,
          maxHeight: 50.0,
          child: Container(
            padding: EdgeInsets.only(left: 16),
            color: Theme.of(context).cardColor,
            alignment: Alignment.centerLeft,
            child:
                Text("section", style: Theme.of(context).textTheme.headline5),
          )),
    );
  }

  ///item
  Widget _getItem(BuildContext context, int index) {
    Menu? menu = Menu(section: "test $index");
    return ItemView(
      menu: menu,
    );
  }
}

////
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    this.minHeight = 50.0,
    this.maxHeight = 0,
    this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget? child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
