import 'package:example/ui/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flutter_eden/src/values/dimen/dimens.dart' as dimens;

///login view
class LoginWidget {
  ///di(IOC)
  final vm = inject<LoginViewModel>();

  void _onLogin(GlobalKey<ScaffoldState> key) async {
    final ret = await vm.signIn();
    if (ret) {
      SnackbarWidget(key, message: "SUCCESS");
    } else {
      SnackbarWidget(key,
          error: true, message: "NOT FOUND", actionMessage: "OK", action: () {
        print("ACTION CLICKED");
      });
    }
    await Future.delayed(Duration(seconds: 1));
    // Navigator.pushReplacement(context, NavSlideFromTop(
    //     page: HomePage()
    // ));

  }

  ///
  Widget form(BuildContext context, GlobalKey<ScaffoldState> key) {
    return Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            LogoWidget(),
            SizedBox(height: 20),
            StreamBuilder(
                stream: vm.login,
                builder: (context, snapshot) {
                  return InputWidget(
                    placeholder: "LOGIN",
                    value: snapshot.data,
                    onChange: (value) => vm.setLogin(value),
                  );
                }),
            SizedBox(height: 10),
            StreamBuilder(
                stream: vm.password,
                builder: (context, snapshot) {
                  return InputWidget(
                    placeholder: "SENHA",
                    value: snapshot.data,
                    onChange: (value) => vm.setPassword(value),
                  );
                }),
            SizedBox(height: 20),
            Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () => print("forgot password click"),
                  child: TextWidget(
                    text: "Esqueci a senha",
                    small: true,
                  ),
                )),
            SizedBox(height: 12),
            ButtonWidget(label: "login", onPress: _onLogin),
          ],
        ),
      ),
    );
  }
}
