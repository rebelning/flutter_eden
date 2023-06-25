import 'package:example/app/routes/routes.dart';
import 'package:example/service/auth_service.dart';
import 'package:flutter_eden/eden.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  AuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    AuthService authService = Get.find<AuthService>();
    if (authService.isLogin == true) {
      return super.redirect(route);
    } else {
      Future.delayed(const Duration(seconds: 1),
          () => EdenSnackbar("请先登录APP", title: "提示"));
      return RouteSettings(name: Routes.app.login);
    }
  }
}
