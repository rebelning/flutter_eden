import 'package:example/ui/login/login_view_model.dart';
import 'package:example/ui/login/login_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_eden/eden.dart';

///login
class LoginPage extends AbstractCoreStreamWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends AbstractCoreStreamWidgetState with LoginWidget {
  final vm = inject<LoginViewModel>();
  @override
  bool getHideToolbar() {
    return false;
  }

  @override
  bool getHideToolbarArrowBack() {
    return false;
  }

  @override
  String getToolbarTitle() {
    return "Login";
  }

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        child: form(context, getScaffoldKey()),
      ),
    );
  }

  @override
  Stream<bool> getStream() {
    return vm.loading;
  }


  @override
  void initData() {
  }
  @override
  void dealloc() {
    vm.clear();

  }



}
