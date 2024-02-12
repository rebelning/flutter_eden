import 'package:example/app/components/page/controllers/demo_controller.dart';
import 'package:example/app/components/page/view/demo_view.dart';
import 'package:flutter_eden/eden.dart';

class DemoPage extends EdenBaseWidget<DemoController> with DemoView {
  DemoPage({Key? key}) : super(key: key);

  @override
  String toolbarTitle() {
    return "Page-${controller.getTag()}";
  }

  @override
  Widget buildBody(BuildContext context, DemoController _controller) {
    return renderItemView(_controller, (tag) {
      _controller.onTapPageView(tag);
    });
  }
}
