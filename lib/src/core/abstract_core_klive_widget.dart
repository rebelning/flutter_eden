import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';

///AutomaticKeepAliveClientMixin
abstract class AbstractCoreKLiveWidget extends AbstractCoreWidget {
  const AbstractCoreKLiveWidget({Key? key}) : super(key: key);
}

///
abstract class AbstractCoreKLiveWidgetState<T extends AbstractCoreKLiveWidget>
    extends AbstractCoreWidgetState<T> with AutomaticKeepAliveClientMixin {
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
