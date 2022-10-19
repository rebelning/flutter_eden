import 'dart:math';

import 'package:example/app/components/dialog/controllers/dialog_demo_controller.dart';
import 'package:example/app/components/dialog/view/dialog_demo_view.dart';

import 'package:flutter_eden/eden.dart';

class DialogDemoPage extends EdenBaseWidget<DialogDemoController>
    with DialogDemoView {
  @override
  String toolbarTitle() {
    return "dialog";
  }

  @override
  Widget buildBody(BuildContext context, DialogDemoController _controller) {
    return renderItemView(() {
      print("onTap");
      // EdenRoute.push(Routes.component.dialog, preventDuplicates: false);
    });
  }
}
