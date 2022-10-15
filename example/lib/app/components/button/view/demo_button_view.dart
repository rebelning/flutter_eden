import 'package:flutter_eden/eden.dart';

class DemoButtonView {
  Widget renderListView(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 32.rpx, right: 32.rpx),
      child: ListView(
        children: [
          SizedBox(height: 40.rpx),
          _elevatedButtonView(),
          SizedBox(height: 40.rpx),
          _textButtonView(),
          SizedBox(height: 40.rpx),
          _outLinedButtonView(),
          SizedBox(height: 40.rpx),
        ],
      ),
    );
  }

  Widget _elevatedButtonView() {
    return Container(
      child: ButtonWidget(
        label: "Elevated Button",
        buttonType: ButtonType.ELEVATED,
        onPressed: () {},
      ),
    );
  }

  Widget _textButtonView() {
    return ButtonWidget(
      label: "Text Button",
      buttonType: ButtonType.TEXT,
      onPressed: () {},
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
