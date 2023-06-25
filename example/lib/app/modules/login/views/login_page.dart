import 'package:example/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_eden/eden.dart';

import 'login_view.dart';

///login page

// ignore: must_be_immutable
class LoginPage extends EdenBaseWidget<LoginController> with LoginView {
  LoginPage({Key? key}) : super(key: key);

  @override
  String toolbarTitle() {
    return "Login";
  }

  void _onLogin() {
    showLoading(controller.onLogin()).then((value) {
      if (value == true) {
        EdenRoute.back();
      } else {}
    });
  }

  @override
  Widget buildBody(BuildContext context, LoginController _controller) {
    return renderView(context, _controller, _onLogin);
  }
}
