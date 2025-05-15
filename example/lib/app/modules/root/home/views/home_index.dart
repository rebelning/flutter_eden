import 'package:flutter_eden/eden.dart';

import '../controllers/home_controller.dart';
import 'home_view.dart';

class HomeIndex extends EdenBaseListView<HomeController> with HomeView {
  HomeIndex({super.key});

  @override
  String toolbarTitle() {
    return "Home";
  }

  @override
  Widget buildListView(BuildContext context, HomeController controller) {
    return renderItemView(context, controller.sourceList, (menu) {
      controller.onMenuInfo(menu);
    });
  }
}
