import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flutter_eden/src/core/stream_base.dart';

///
abstract class AbstractMvvmStreamBase extends AbstractMvvmBase {
  const AbstractMvvmStreamBase({Key? key}) : super(key: key);
}

///
abstract class AbstractMvvmStreamBaseState<T extends AbstractMvvmStreamBase>
    extends AbstractMvvmBaseState<T> implements BaseStream {
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
    return StreamBuilder(
        stream: getStream(),
        builder: (context, snapshot) {
          return LoadingWidget(
            message: "Loading...",
            status: snapshot.data as bool,
            child: getBottomNavigationBar() == null
                ? SafeArea(
                    child: buildBody(context),
                  )
                : buildBody(context),
          );
        });
  }
}
