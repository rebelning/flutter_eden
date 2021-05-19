import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';

///
abstract class AbstractMVVMBase extends StatefulWidget {
  const AbstractMVVMBase({Key key}) : super(key: key);
}

///
abstract class AbstractMVVMBaseState<T extends AbstractMVVMBase>
    extends State<T> {
  bool _debugShowCheckedModeBanner = true;
  Key _scaffoldKey;
  String _toolbarTitle;

  ///hide toolbar
  bool getHideToolbar();

  /// hide toolbar arrow
  bool getHideToolbarArrowBack();

  ///tool title
  String getToolbarTitle();

  bool getDebugShowCheckedModeBanner() => _debugShowCheckedModeBanner;

  /// toolbar title color
  Color getToolbarTitleColor() =>
      Theme.of(context).colorScheme.toolbarTitleColor;

  void setToolbarTitle(String toolbarTitle) {
    this._toolbarTitle = toolbarTitle;
    if (mounted) setState(() {});
  }

  ///toolbar arrow back
  Widget getToolbarArrowBack() {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        pop(context);
      },
    );
  }

  ///
  Widget getAppbar() {
    return getHideToolbar()
        ? null
        : ToolbarWidget(
            hideBackArrow: getHideToolbarArrowBack(),
            title: _toolbarTitle == null ? getToolbarTitle() : _toolbarTitle,
            color: getToolbarTitleColor(),
          );
  }

  ///
  Key getScaffoldKey() => _scaffoldKey;

  ///build body
  Widget buildBody(BuildContext context);

  Widget getBottomNavigationBar() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppbar(),
      body: SafeArea(
        child: buildBody(context),
      ),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  void pop(context) {
    Navigator.pop(context);
  }

  void popResult(context, Object value) {
    Navigator.pop(context, value);
  }
}
