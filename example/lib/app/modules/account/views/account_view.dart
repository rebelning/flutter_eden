import 'package:example/app/modules/account/controllers/account_controller.dart';

import 'package:example/app/routes/routes.dart';
import 'package:example/domain/entity/menu_model.dart';
import 'package:example/domain/entity/user_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter_eden/eden.dart';

import 'item_view.dart';

///
enum AppBarBehavior { normal, pinned, floating, snapping }

class AccountView {
  double _appBarHeight = 0.0;
  double? screenWidth;
  double? screenHeight;
  double? imageWidth;
  double? imageHeight;
  double? _statusBarHeight;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

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

  void _login() {
    RouteCore.push(Routes.app.login);
  }

  Widget sliverView(BuildContext context, AccountController? _controller) {
    _getScreenInfo(context);
    _appBarHeight = imageHeight ?? 0 - _statusBarHeight!;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: _appBarHeight,
          pinned: _appBarBehavior == AppBarBehavior.pinned,
          floating: _appBarBehavior == AppBarBehavior.floating ||
              _appBarBehavior == AppBarBehavior.snapping,
          snap: _appBarBehavior == AppBarBehavior.snapping,
          actions: <Widget>[
            IconButton(
              icon: (const Icon(Icons.settings)),
              onPressed: () {
                // _getMenuList(context, key);
                _controller?.toSetting();
              },
            )
          ],
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            collapseMode: CollapseMode.parallax,
            title: Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Text(
                '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            background: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                _userView(context, _controller),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              MenuInfo? menu = AccountController.to.menuList?[index];

              return _getItem(context, menu);
            },
            childCount: AccountController.to.menuList?.length,
          ),
        ),
      ],
    );
  }

  ///user info
  Widget _userView(BuildContext context, AccountController? _controller) {
    final isLogin = _controller?.authService?.isLogin;
    return isLogin == true
        ? _getLoginView(context, _controller)
        : _getUnLoginView(context);
  }

  ///login view
  Widget _getLoginView(BuildContext context, AccountController? _controller) {
    UserInfo? user = _controller?.authService?.userInfo;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            text: "${user?.username}",
            color: Colors.white,
          ),
          TextWidget(
            text: "${user?.mobile}",
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  ///unlogin view
  Widget _getUnLoginView(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonWidget(
            label: "login",
            transparent: true,
            onPressed: () {
              _login();
            },
          )
        ],
      ),
    );
  }

  ///
  Widget _getItem(BuildContext context, MenuInfo? menu) {
    return ItemView(
      menu: menu,
      onTapMenu: (context, menu) {
        if (menu?.menuId == "2002") {
          RouteCore.push(Routes.app.proxy);
        }
      },
    );
  }
}
