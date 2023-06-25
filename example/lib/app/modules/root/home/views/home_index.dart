import 'package:flutter_eden/eden.dart';

import '../controllers/home_controller.dart';
import 'home_view.dart';

class HomeIndex extends EdenBaseListWidget<HomeController> with HomeView {
  @override
  String toolbarTitle() {
    return "Home";
  }

  @override
  Widget buildListView(BuildContext context, HomeController _controller) {
    return renderItemView(context, _controller.sourceList, (menu) {
      _controller.onMenuInfo(menu);
    });
  }
}
