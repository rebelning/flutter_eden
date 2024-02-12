import 'package:example/app/components/button/controllers/demo_button_controller.dart';
import 'package:flutter_eden/eden.dart';

mixin class DemoButtonView {
  Widget renderListView(
      BuildContext context, DemoButtonController _controller) {
    return Container(
      padding: EdgeInsets.only(left: 32.rpx, right: 32.rpx),
      child: ListView(
        children: [
          SizedBox(height: 40.rpx),
          _elevatedButtonView(_controller),
          SizedBox(height: 40.rpx),
          _textButtonView(_controller),
          SizedBox(height: 40.rpx),
          _outLinedButtonView(),
          SizedBox(height: 40.rpx),
        ],
      ),
    );
  }

  Widget _elevatedButtonView(DemoButtonController _controller) {
    return Container(
      child: ButtonWidget(
        label: "snackbar",
        buttonType: ButtonType.ELEVATED,
        onPressed: () {
          _controller.showSnackbar();
        },
      ),
    );
  }

  Widget _textButtonView(DemoButtonController _controller) {
    return ButtonWidget(
      label: "showLoading",
      buttonType: ButtonType.TEXT,
      onPressed: () {
        _controller.showLoad();
      },
    );
  }

  Widget _outLinedButtonView() {
    return ButtonWidget(
      label: "OutLined Button",
      buttonType: ButtonType.OUTLINED,
      disabled: true,
      onPressed: () {},
    );
  }
}
