import 'package:example/ui/account/account_view_model.dart';
import 'package:example/ui/account/account_widget.dart';
import 'package:example/ui/login/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_eden/eden.dart';

///
class AccountPage extends AbstractMvvmKLiveBase {


  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends AbstractMvvmKLiveBaseState with AccountWidget {
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
    return StreamBuilder(
        stream: vm.loading,
        builder: (context, snapshot) {
          return LoadingWidget(
            message: "Loading...",
            status: snapshot.data as bool,
            child: sliverView(context, getScaffoldKey()),
          );
        });
  }


}
