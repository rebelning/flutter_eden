import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flutter_eden/src/core/stream_base.dart';

///
abstract class AbstractCoreStreamWidget extends AbstractCoreWidget {
  const AbstractCoreStreamWidget({Key? key}) : super(key: key);
}

///
abstract class AbstractCoreStreamWidgetState<T extends AbstractCoreStreamWidget>
    extends AbstractCoreWidgetState<T> implements BaseStream<LoadingMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: getScaffoldKey(),
      appBar: getAppbar(),
      //safe Area
      body: streamBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  ///
  Widget streamBody() {
    return StreamBuilder<LoadingMessage?>(
        stream: getStream(),
        builder: (context, snapshot) {
          LoadingMessage? loadingMsg = snapshot.data;
          showSnack(context, loadingMsg?.message);
          return LoadingWidget(
            message: "Loading...",
            status: loadingMsg?.loading,
            child: getBottomNavigationBar() == null
                ? SafeArea(
                    child: buildBody(context),
                  )
                : buildBody(context),
          );
        });
  }
}
