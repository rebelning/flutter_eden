import 'package:example/app/components/tab/children/controller/tab_info_controller.dart';
import 'package:flutter_eden/eden.dart';

class TabInfoView extends EdenBaseWidget<TabInfoController> {
  final int? tabIndex;
  TabInfoView({
    this.tabIndex,
  });
  @override
  bool hideToolbar() {
    return true;
  }

  @override
  String toolbarTitle() {
    return "";
  }

  @override
  Widget buildBody(BuildContext context, TabInfoController _controller) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text("TabIndex=$tabIndex"),
      ),
    );
  }
}
