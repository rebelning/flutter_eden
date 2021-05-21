import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_eden/eden.dart';

class Home extends AbstractMvvmKLiveBase {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends AbstractMvvmKLiveBaseState<Home> {
  // @override
  // bool get wantKeepAlive => true;

  @override
  bool getHideToolbar() {
    return false;
  }

  @override
  bool getHideToolbarArrowBack() {
    return true;
  }

  @override
  String getToolbarTitle() {
    return "Home";
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: TextWidget(text: 'home...'),
    );
  }


}
