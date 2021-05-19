import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flutter_eden/src/values/dimens.dart' as Dimens;

abstract class AbstractMVVMBase extends StatefulWidget {
  const AbstractMVVMBase({Key key}) : super(key: key);
}

abstract class AbstractMvpBaseState<T extends AbstractMVVMBase>
    extends State<T> {
  String _toolbarTitle = "";
  bool _hideToolbarArrowBack = false;
  BuildContext bodyContext;

  // Widget progressBar = ProgressBar();
  bool _showProgress = false;
  bool _hideToolbar = false;
  bool _debugShowCheckedModeBanner = true;

  /*
   *hide toolbar
   */
  bool getHideToolbar() => _hideToolbar;

  bool getHideToolbarArrowBack() => _hideToolbarArrowBack;

  /*
   *toolbar title
   */
  String getToolbarTitle() => _toolbarTitle;

  bool getDebugShowCheckedModeBanner() => _debugShowCheckedModeBanner;

  ///
  Widget getAppbar(bool hideToolbar, {Widget bottom, Widget title}) {
    return hideToolbar
        ? null
        : ToolbarWidget(
            hideBackArrow: getHideToolbarArrowBack(),
            title: getToolbarTitle(),
          );
  }

  // Widget getAppbar(bool hideToolbar, {Widget bottom, Widget title}) {
  //   return hideToolbar
  //       ? null
  //       : AppBar(
  //           leading: getHideToolbarArrowBack()
  //               ? null
  //               : IconButton(
  //                   icon: Icon(Icons.arrow_back),
  //                   onPressed: () {
  //                     print('onPressed...');
  //                     pop(context);
  //                   },
  //                 ),
  //           title: title == null
  //               ? Text(
  //                   getToolbarTitle(),
  //                   style: TextStyle(
  //                       color: Colors.white, fontSize: Dimens.fontText),
  //                 )
  //               : title,
  //           centerTitle: true,
  //           bottom: bottom,
  //         );
  // }

  void pop(context) {
    Navigator.pop(context);
  }

  void popResult(context, Object value) {
    Navigator.pop(context, value);
  }
}
