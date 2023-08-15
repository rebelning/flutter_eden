import 'package:example/app/components/tab/children/view/tab_info_view.dart';
import 'package:example/app/components/tab/controller/tab_index_controller.dart';
import 'package:example/app/components/tab/view/tab_bar_cus_view.dart';
import 'package:flutter_eden/eden.dart';

class TabIndexPage extends EdenBaseWidget<TabIndexController> {
  @override
  String toolbarTitle() {
    return "TabDemo";
  }

  @override
  Widget buildBody(BuildContext context, TabIndexController _controller) {
    return Container(
      child: Column(
        children: [
          TabBarCusView(
            tabTitles: _controller.tabTitles ?? [],
            onTabController: (value) => _controller.setTabController(value),
            onTabChanged: (index) => _controller.setPageIndex(index),
          ),
          Expanded(child: _renderPageView()),
        ],
      ),
    );
  }

  Widget _renderPageView() {
    return PageView(
      controller: controller.pageController,
      children: [
        EdenKeepAliveWrapper(
          child: TabInfoView(
            tabIndex: 0,
          ),
        ),
        EdenKeepAliveWrapper(
          child: TabInfoView(
            tabIndex: 1,
          ),
        ),
        EdenKeepAliveWrapper(
          child: TabInfoView(
            tabIndex: 2,
          ),
        ),
        EdenKeepAliveWrapper(
          child: TabInfoView(
            tabIndex: 3,
          ),
        ),
        EdenKeepAliveWrapper(
          child: TabInfoView(
            tabIndex: 4,
          ),
        ),
        EdenKeepAliveWrapper(
          child: TabInfoView(
            tabIndex: 5,
          ),
        ),
      ],
      onPageChanged: (index) {
        controller.setTabIndex(index);
      },
    );
  }
}
