import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_eden/eden.dart';

class Home extends AbstractMVVMBase {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends AbstractMVVMBaseState<Home> {
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
    return "首页";
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Text('home...'),
    );
  }
}
