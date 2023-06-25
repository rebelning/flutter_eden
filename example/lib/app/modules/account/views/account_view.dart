import 'package:example/app/modules/account/controllers/account_controller.dart';

import 'package:example/app/routes/routes.dart';
import 'package:example/domain/entity/menu_model.dart';
import 'package:example/domain/entity/user_model.dart';
import 'package:example/values/example_images.dart';

import 'package:flutter_eden/eden.dart';

import 'item_view.dart';

///
enum AppBarBehavior { normal, pinned, floating, snapping }

class AccountView {
  void _login() {
    EdenRoute.push(Routes.app.login);
  }

  Widget sliverView(BuildContext context, AccountController _controller) {
    return ExtendedNestedScrollView(
      onlyOneScrollInBody: true,
      pinnedHeaderSliverHeightBuilder: () {
        return MediaQuery.of(context).padding.top + kToolbarHeight;
      },
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          // SliverOverlapAbsorber(
          //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          //   sliver: _renderSliverAppBar(
          //     innerBoxIsScrolled,
          //     _controller,
          //   ),
          // ),
          _renderSliverAppBar(
            innerBoxIsScrolled,
            _controller,
          )
        ];
      },
      body: Column(
        children: [
          Expanded(
              child: ExtendedVisibilityDetector(
            uniqueKey: const Key('nestedScrollView'),
            child: SmartRefresher(
              controller: _controller.refreshController,
              onRefresh: _controller.onRefresh,
              child: CustomScrollView(
                slivers: [
                  // SliverOverlapInjector(
                  //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  //       context),
                  // ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (index > 4) return _renderEmptyItem();
                        MenuInfo? menu = AccountController.to.menuList?[index];
                        return _getItem(
                          context,
                          menu,
                          (route) {
                            _controller.onRouteView(route);
                          },
                        );
                      },
                      childCount: _controller.menuList?.length,
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  _renderEmptyItem() {
    return Container(
      color: Colors.transparent,
      height: 60.rpx,
      child: const ListTile(),
    );
  }

  _renderSliverAppBar(
    bool innerBoxIsScrolled,
    AccountController _controller,
  ) {
    return SliverAppBar(
      title: innerBoxIsScrolled == false
          ? const Text("")
          : Text('Me',
              style: TextStyle(
                color: const Color(0xff000000),
                fontSize: 35.rpx,
                fontWeight: FontWeight.w500,
              )),
      centerTitle: true,
      pinned: true,
      floating: false,
      // snap: true,
      // expandedHeight: 410.rpx,
      expandedHeight: 210.rpx,
      // collapsedHeight: 300.rpx,
      stretchTriggerOffset: 200.rpx,
      forceElevated: innerBoxIsScrolled,

      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: EdgeInsets.only(left: 40.rpx, top: 20.rpx, right: 40.rpx),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                ExampleImages.account_background,
              ),
            ),
          ),
          child: Container(),
        ),
        collapseMode: CollapseMode.parallax,
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
      ),
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
  Widget _getItem(
    BuildContext context,
    MenuInfo? menu,
    Function(String? route) onItemClick,
  ) {
    return ItemView(
      menu: menu,
      onTapMenu: (context, menu) {
        onItemClick(menu?.action);
        // if (menu?.menuId == "2002") {
        //   EdenRoute.push(Routes.app.proxy);
        // }
      },
    );
  }
}
