import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';

///
abstract class AbstractCoreWidget extends StatefulWidget {
  const AbstractCoreWidget({Key? key}) : super(key: key);
}

///
abstract class AbstractCoreWidgetState<T extends AbstractCoreWidget>
    extends State<T> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState>? getScaffoldKey() => _scaffoldKey;

  ///toolbar title
  String? _toolbarTitle;

  ///hide toolbar
  bool getHideToolbar();

  /// hide toolbar arrow
  bool getHideToolbarArrowBack();

  ///tool title
  String getToolbarTitle();

  /// toolbar title color
  Color getToolbarTitleColor() =>
      Theme.of(context).colorScheme.onPrimary;

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
  PreferredSizeWidget? getAppbar() {
    return getHideToolbar()
        ? null
        : ToolbarWidget(
            hideBackArrow: getHideToolbarArrowBack(),
            title: _toolbarTitle == null ? getToolbarTitle() : _toolbarTitle,
            color: getToolbarTitleColor(),
          );
  }

  ///

  ///dealloc
  void dealloc();

  ///init
  void initData();

  ///build body
  Widget buildBody(BuildContext context);

  ///bottom navigation bar
  Widget? getBottomNavigationBar() {
    return null;
  }

  Widget? getFloatingActionButton(){
    return null;
  }
  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    super.dispose();
    dealloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppbar(),
      //safe Area
      body: parentBody,
      floatingActionButton: getFloatingActionButton(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget get parentBody => getBottomNavigationBar() == null
      ? SafeArea(
          child: buildBody(context),
        )
      : buildBody(context);

  void pop(context) {
    Navigator.pop(context);
  }

  void popResult(context, Object value) {
    Navigator.pop(context, value);
  }

  ///show snack bar
  void showSnack(BuildContext context, String? message) {
    if (message == null) return;

    ///
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      SnackbarWidget(context,
          error: true, message: message, actionMessage: "OK", action: () {});
    });
  }
}
