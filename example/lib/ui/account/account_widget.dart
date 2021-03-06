import 'package:example/config/routes.dart';
import 'package:example/domain/models/menu.dart';
import 'package:example/domain/models/user.dart';
import 'package:example/ui/components/item_view.dart';
import 'package:example/ui/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flutter_eden/src/values/dimen/dimens.dart' as dimens;
import 'package:example/value/color/color_theme.dart';
import 'account_view_model.dart';

///
enum AppBarBehavior { normal, pinned, floating, snapping }

///
class AccountWidget {
  final vm = inject<AccountViewModel>();

  //login
  final vmLogin = inject<LoginViewModel>();
  double _appBarHeight = 0.0;
  double? screenWidth;
  double? screenHeight;
  double? imageWidth;
  double? imageHeight;
  double? _statusBarHeight;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  // String _title = "Me";

  void _getScreenInfo(context) {
    _statusBarHeight = MediaQuery.of(context).padding.top;
    DebugLog.log('status-height:', _statusBarHeight.toString());
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    imageWidth = screenWidth; // image width
    imageHeight = imageWidth! * 9 / 16.0; // image height4:3
    DebugLog.log("imageWidth:", imageWidth.toString());
    DebugLog.log('imageHeight:', imageHeight.toString());
  }

  void _getMenuList(BuildContext context, GlobalKey<ScaffoldState>? key) async {
    bool flag = await vm.getMenuList();
    // if (ret.resCode==200) {
    //   SnackbarWidget(key, message: ret.message);
    // } else {
    //   SnackbarWidget(key,
    //       error: true,
    //       message: ret.message,
    //       actionMessage: "OK",
    //       action: () {});
    // }
  }

  void _login(BuildContext context) {
    NavigateRouter().navigateTo(context, Routes.login);
  }

  void onTapMenu(BuildContext context, Menu? info) {
    NavigateRouter().navigateTo(context, info?.action);
  }

  Widget sliverView(BuildContext context, GlobalKey<ScaffoldState>? key) {
    _getScreenInfo(context);
    this._appBarHeight = imageHeight! - _statusBarHeight!;
    return Container(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: this._appBarHeight,
            pinned: _appBarBehavior == AppBarBehavior.pinned,
            floating: _appBarBehavior == AppBarBehavior.floating ||
                _appBarBehavior == AppBarBehavior.snapping,
            snap: _appBarBehavior == AppBarBehavior.snapping,
            actions: <Widget>[
              IconButton(
                icon: (const Icon(Icons.refresh)),
                onPressed: () {
                  _getMenuList(context, key);
                },
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              title: Padding(
                padding: EdgeInsets.only(left: 0.0),
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
                  _userView(context),
                ],
              ),
            ),
          ),
          StreamBuilder<List<Menu>?>(
              stream: vm.menuList,
              builder: (context, snapshot) {
                List<Menu>? tmpList = snapshot.data;

                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    Menu? menu;
                    if (tmpList != null) {
                      menu = tmpList[index];
                    }
                    return _getItem(context, menu);
                  },
                  childCount: tmpList?.length,
                ));
              }),
        ],
      ),
    );
  }

  ///user info
  Widget _userView(BuildContext context) {
    return StreamBuilder(
      stream: vmLogin.isLogin,
      builder: (context, snapshot) {
        bool isLogin = false;
        if (snapshot.data != null) {
          isLogin = snapshot.data as bool;
        }
        return isLogin ? _getLoginView(context) : _getUnLoginView(context);
      },
    );
  }

  ///login view
  Widget _getLoginView(BuildContext context) {
    return StreamBuilder<User?>(
        stream: vmLogin.userInfo,
        builder: (context, snapshot) {
          User? user = snapshot.data;
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: "${user?.username}",
                  color: Theme.of(context).colorScheme.color_whitle,
                ),
                TextWidget(
                  text: "${user?.mobile}",
                  color: Theme.of(context).colorScheme.color_whitle,
                )
              ],
            ),
          );
        });
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
            onPress: () {
              _login(context);
            },
          )
        ],
      ),
    );
  }

  ///
  Widget _getItem(BuildContext context, Menu? menu) {
    return ItemView(
      menu: menu,
      onTapMenu: (context, menu) {
        onTapMenu(context!, menu);
      },
    );
  }
}
