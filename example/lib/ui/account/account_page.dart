import 'package:example/ui/account/account_view_model.dart';
import 'package:example/ui/account/account_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_eden/eden.dart';

///
class AccountPage extends AbstractCoreKLiveWidget {
  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends AbstractCoreKLiveWidgetState
    with AccountWidget {
  final vm = inject<AccountViewModel>();

  @override
  void initState() {
    super.initState();
    vm.getMenuList();
  }

  @override
  bool getHideToolbar() {
    return true;
  }

  @override
  bool getHideToolbarArrowBack() {
    return false;
  }

  @override
  String getToolbarTitle() {
    return "Account...";
  }

  @override
  Widget buildBody(BuildContext context) {
    return StreamBuilder<LoadingMessage>(
        stream: vm.loading,
        builder: (BuildContext context, snapshot) {
          return LoadingWidget(
            message: "Loading...",
            status: snapshot.data?.loading,
            child: sliverView(context, getScaffoldKey()),
          );
        });
  }

  @override
  void dealloc() {
    vm.clear();
  }

  @override
  void initData() {}
}
