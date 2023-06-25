import 'package:example/app/components/button/controllers/demo_button_controller.dart';
import 'package:flutter_eden/eden.dart';

import 'demo_button_view.dart';

class DemoButtonPage extends EdenBaseWidget<DemoButtonController>
    with DemoButtonView {
  @override
  String toolbarTitle() {
    return "ButtonView";
  }

  @override
  Widget buildBody(BuildContext context, DemoButtonController _controller) {
    return renderListView(context, _controller);
  }
}
