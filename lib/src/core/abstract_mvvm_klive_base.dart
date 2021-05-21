import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';

///AutomaticKeepAliveClientMixin
abstract class AbstractMvvmKLiveBase extends AbstractMvvmBase {
  const AbstractMvvmKLiveBase({Key key}) : super(key: key);
}

///
abstract class AbstractMvvmKLiveBaseState<T extends AbstractMvvmKLiveBase>
    extends AbstractMvvmBaseState<T> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ///build body
  Widget buildBody(BuildContext context) {
    return Center(
      child: TextWidget(
        text: "override buildBody method",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: getScaffoldKey(),
      appBar: getAppbar(),
      body: buildBody(context),
    );
  }
}
