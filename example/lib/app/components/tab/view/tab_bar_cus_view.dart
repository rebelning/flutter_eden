import 'package:flutter_eden/eden.dart';

///
class TabBarCusView extends StatefulWidget {
  final List<String> tabTitles;
  final ValueChanged<TabController> onTabController;
  final ValueChanged<int> onTabChanged;
  TabBarCusView({
    Key? key,
    required this.tabTitles,
    required this.onTabController,
    required this.onTabChanged,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => TabBarCusViewState();
}

class TabBarCusViewState extends State<TabBarCusView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.tabTitles.length, vsync: this);
    widget.onTabController(_tabController);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      tabs: widget.tabTitles
          .map((title) => Tab(
                text: title,
              ))
          .toList(),
      onTap: (index) => widget.onTabChanged(index),
    );
  }
}
