import 'package:flutter_eden/eden.dart';

import '../controllers/account_controller.dart';
import 'account_view.dart';

class AccountPage extends EdenBaseWidget<AccountController> with AccountView {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  AccountPage({Key? key}) : super(key: key);
  @override
  String toolbarTitle() {
    return "Account";
  }

  @override
  bool hideToolbar() {
    return true;
  }

  void _onRefresh() async {
    ///
    await AccountController.to.getMenuList();
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  Widget buildBody(BuildContext context, AccountController _controller) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: false,
      onRefresh: () {
        _onRefresh();
      },
      child: sliverView(context, _controller),
    );
  }
}
