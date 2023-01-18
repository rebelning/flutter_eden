import 'package:example/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_eden/eden.dart';

import 'package:flutter_eden/src/values/dimen/dimens.dart' as dimens;

class LoginView {
  Widget renderView(
      BuildContext context, LoginController _controller, Function() onLogin) {
    return SingleChildScrollView(
      child: form(context, _controller, onLogin),
    );
  }

  ///
  Widget form(
      BuildContext context, LoginController _controller, Function() onLogin) {
    return Padding(
      padding: const EdgeInsets.all(dimens.margin),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const LogoWidget(
              small: true,
            ),
            const SizedBox(height: 20),
            InputWidget(
              placeholder: "login",
              // value: snapshot.data,
              onChanged: (value) {
                _controller.setUsername(value);
              },
            ),
            const SizedBox(height: 10),
            InputWidget(
              placeholder: "password",

              // value: snapshot.data,
              onChanged: (value) {
                _controller.setPassword(value);
              },
            ),
            const SizedBox(height: 20),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const TextWidget(
                    text: "sign up",
                  ),
                )),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget(
                label: "login",
                onPressed: () {
                  onLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
