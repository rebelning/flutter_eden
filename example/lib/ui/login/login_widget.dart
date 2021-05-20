import 'package:example/ui/login/login_view_model.dart';
import 'package:flutter_eden/eden.dart';

///login view
class LoginWidget {
  ///di(IOC)
  final vm = Injector.of()<LoginViewModel>();
}
