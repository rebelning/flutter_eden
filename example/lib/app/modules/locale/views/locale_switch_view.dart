import 'package:example/app/modules/locale/controller/locale_switch_controller.dart';
import 'package:flutter_eden/eden.dart';

class LocaleSwitchView extends EdenBaseWidget<LocaleSwitchController> {
  @override
  String toolbarTitle() {
    return "language_title".tr;
  }

  @override
  Widget buildBody(BuildContext context, LocaleSwitchController _controller) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("helloworld".tr),
          ),
          Container(
            child: ElevatedButton(
              child: Text("switch_language".tr),
              onPressed: () {
                _controller.switchLanguage();
              },
            ),
          )
        ],
      ),
    );
  }
}
