import 'package:example/config/routes.dart';
import 'package:example/domain/models/menu.dart';
import 'package:example/domain/models/user.dart';
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
  String _title = "Me";

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

  void _getMenuList(BuildContext context, Key? key) {
    vm.getMenuList();
  }

  void _login(BuildContext context) {
    NavigateRouter().navigateTo(context, Routes.login);
  }

  void onTapMenu(BuildContext context, Menu? info) {
    NavigateRouter().navigateTo(context, info?.action);
  }

  Widget sliverView(BuildContext context, Key? key) {
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
                  style: new TextStyle(
                    fontSize: dimens.fontTextSmall,
                    color: Theme.of(context).colorScheme.toolbarTitleColor,
                  ),
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
          StreamBuilder(
              stream: vm.menuList,
              builder: (context, snapshot) {
                List<Menu> tmpList = snapshot.data as List<Menu>;

                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    Menu menu = tmpList[index];
                    return _getItem(context, menu);
                  },
                  childCount: tmpList == null ? 0 : tmpList.length,
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
    return StreamBuilder(
        stream: vmLogin.userInfo,
        builder: (context, snapshot) {
          User user = snapshot.data as User;
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
  Widget _getItem(BuildContext context, Menu menu) {
    return InkWell(
      child: Container(
        decoration: ShapeDecoration(
          shape: Border(
            bottom: BorderSide(
                color: Theme.of(context).colorScheme.color_line,
                width: dimens.padding_0),
          ),
        ),
        padding: EdgeInsets.all(dimens.padding_15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "${menu.section}",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.color_333333,
                    fontSize: dimens.fontTextSmall),
                textAlign: TextAlign.left,
              ),
              flex: 7,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.color_999999,
                        fontSize: dimens.fontTextSmall),
                    textAlign: TextAlign.right,
                  ),
                  IconButton(
                    onPressed: (){},
                    padding: EdgeInsets.all(0),
                    iconSize: dimens.padding_15,
                    constraints: BoxConstraints(
                        minWidth: 0, minHeight: dimens.min_height),
                    alignment: Alignment.centerRight,
                    color: Theme.of(context).colorScheme.color_999999,
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
              flex: 3,
            ),
          ],
        ),
      ),
      onTap: () {
        onTapMenu(context, menu);
      },
    );
  }
}
