import 'package:example/ui/account/account_view_model.dart';
import 'package:example/ui/account/account_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
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
    return StreamBuilder<bool>(
        stream: vm.loading,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return LoadingWidget(
            message: "Loading...",
            status: snapshot.data,
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
