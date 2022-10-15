import 'package:flutter_eden/eden.dart';

import '../controllers/splash_service.dart';

class SplashView extends EdenBaseServiceWidget<SplashService> {
  SplashView({Key? key}) : super(key: key);

  @override
  String toolbarTitle() {
    return "";
  }

  @override
  bool hideToolbar() {
    return true;
  }

  @override
  Widget buildBody(BuildContext context, SplashService _controller) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Text(
                _controller.welcomeStr[_controller.activeStr.value],
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
