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
  final errorVM = inject<ErrorClient>();

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
            child: _error(context),
          );
        });
  }

  Widget _error(BuildContext context) {
    return StreamBuilder<SnackMessage?>(
        stream: errorVM.stream,
        builder: (context, snapshot) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            if (snapshot.data?.message != null)
              showSnack(snapshot.data?.message);
          });

          return sliverView(context, getScaffoldKey());
        });
  }

  @override
  void dealloc() {}

  @override
  void initData() {}
}
