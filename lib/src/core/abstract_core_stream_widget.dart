import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flutter_eden/src/core/stream_base.dart';
import 'package:flutter_eden/src/locale/eden_localizations.dart';

///
abstract class AbstractCoreStreamWidget extends AbstractCoreWidget {
  const AbstractCoreStreamWidget({Key? key}) : super(key: key);
}

///
abstract class AbstractCoreStreamWidgetState<T extends AbstractCoreStreamWidget>
    extends AbstractCoreWidgetState<T> implements BaseStream<LoadingMessage> {
  ///
  bool _isSafeArea = true;

  bool get isSafeArea => _isSafeArea;
  @override
  bool getHideToolbar() {
    return false;
  }

  @override
  bool getHideToolbarArrowBack() {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    EdenString strings =
        EdenLocalizations.of(context)?.currentLocalization ?? EnEdenString();

    return Scaffold(
      key: getScaffoldKey(),
      appBar: getAppbar(),
      //safe Area
      body: streamBody(strings),
      floatingActionButton: getFloatingActionButton(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  ///
  Widget streamBody(EdenString strings) {
    return StreamBuilder<LoadingMessage?>(
        stream: getStream(),
        builder: (context, snapshot) {
          LoadingMessage? loadingMsg = snapshot.data;
          showSnack(context, loadingMsg?.message);
          return LoadingWidget(
            message: strings.loadingText,
            status: loadingMsg?.loading,
            child: isSafeArea
                ? SafeArea(
                    child: buildBody(context),
                  )
                : buildBody(context),
          );
        });
  }
}
