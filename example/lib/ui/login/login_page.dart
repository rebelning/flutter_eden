import 'package:example/ui/login/login_view_model.dart';
import 'package:example/ui/login/login_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_eden/eden.dart';

class LoginPage extends AbstractMvvmBase {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class LoginPageState extends AbstractMvvmBaseState with LoginWidget {
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
    return form(context, getScaffoldKey());
  }
}
