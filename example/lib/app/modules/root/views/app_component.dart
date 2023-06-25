import 'package:example/app/modules/account/views/account_page.dart';
import 'package:example/app/modules/root/home/views/home_index.dart';
import 'package:example/app/modules/root/message/views/message_page.dart';

import 'package:flutter_eden/eden.dart';

import '../controllers/app_controller.dart';

class AppComponent extends EdenNavBaseWidget<AppController> {
  @override
  String toolbarTitle() {
    return "";
  }

  @override
  bool hideToolbar() {
    return true;
  }

  @override
  List<BottomNavigationBarItem> renderBarItems() {
    return [
      const BottomNavigationBarItem(
        label: "Home",
        icon: Icon(
          Icons.home,
        ),
      ),
      const BottomNavigationBarItem(
        label: "Message",
        icon: Icon(
          Icons.message,
        ),
      ),
      const BottomNavigationBarItem(
        label: "Me",
        icon: Icon(
          Icons.account_circle,
        ),
      ),
    ];
  }

  @override
  List<Widget> renderPages() {
    return [
      EdenKeepAliveWrapper(child: HomeIndex()),
      EdenKeepAliveWrapper(child: MessagePage()),
      EdenKeepAliveWrapper(child: AccountPage()),
    ];
  }
}
