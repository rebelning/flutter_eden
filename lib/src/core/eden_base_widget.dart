import 'package:flutter_eden/eden.dart';

///
// ignore: must_be_immutable
abstract class EdenBaseWidget<T extends EdenBaseController> extends GetView<T> {
  EdenBaseWidget({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState>? getScaffoldKey() => _scaffoldKey;

  ///toolbar title
  String? _toolbarTitle;

  ///hide toolbar
  bool hideToolbar() {
    return false;
  }

  /// hide toolbar arrow
  bool hideToolbarArrowBack() {
    return false;
  }

  ///tool title
  String toolbarTitle();

  void setToolbarTitle(String? toolbarTitle) {
    _toolbarTitle = toolbarTitle;
  }

  /// toolbar title color
  Color? _toolbarTitleColor;
  Color? get toolbarTitleColor => _toolbarTitleColor;
  void setToolbarTitleColor(Color? titleColor) {
    _toolbarTitleColor = titleColor;
  }

  /// toolbar background color
  Color? _toolbarBackgroundColor;
  Color? get toolbarBackgroundColor => _toolbarBackgroundColor;
  void setToolbarBackgroundColor(Color? backgroundColor) {
    _toolbarBackgroundColor = backgroundColor;
  }

  IconThemeData? _iconTheme;
  IconThemeData? get iconTheme => _iconTheme;
  IconThemeData? _actionsIconTheme;
  IconThemeData? get actionsIconTheme => _actionsIconTheme;
  bool? _resizeToAvoidBottomInset;
  bool? get resizeToAvoidBottomInset => _resizeToAvoidBottomInset;

  List<Widget>? toolbarActions() {
    return [];
  }

  Widget? toolbarLeading() => null;

  double? leadingWidth() => null;

  double? toolbarHeight() => null;

  ///toolbar arrow back
  @protected
  Widget toolbarArrowBack() {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {},
    );
  }

  ///
  @protected
  PreferredSizeWidget? appToolbar(BuildContext context) {
    return hideToolbar()
        ? null
        : ToolbarWidget(
            centerTitle: true,
            backgroundColor: toolbarBackgroundColor,
            hideBackArrow: hideToolbarArrowBack(),
            iconTheme: iconTheme,
            actionsIconTheme: actionsIconTheme,
            title: _toolbarTitle ?? toolbarTitle(),
            color: toolbarTitleColor,
            leading: toolbarLeading(),
            leadingWidth: leadingWidth(),
            toolbarHeight: toolbarHeight(),
            actions: toolbarActions(),
          );
  }

  ///build body
  @protected
  Widget buildBody(BuildContext context, T _controller);

  ///bottom navigation bar
  @protected
  Widget? bottomNavigationBar() => null;
  @protected
  Widget? floatingActionButton() => null;
  Widget? endDrawer() => null;

  ///
  void openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  ///
  void closeEndDrawer() {
    _scaffoldKey.currentState?.closeEndDrawer();
  }

  bool endDrawerEnableOpenDragGesture() {
    return true;
  }

  void onEndDrawerChanged(bool changed) {}
  void onDrawerChanged(bool changed) {}
  void onInitState(GetBuilderState<T> state) {}
  void onDispose(GetBuilderState<T> dispose) {}
  void didChangeDependencies(GetBuilderState<T> dispose) {}
  void didUpdateWidget(
      GetBuilder<GetxController> controller, GetBuilderState<T> state) {}

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
        init: controller,
        initState: onInitState,
        dispose: onDispose,
        didChangeDependencies: didChangeDependencies,
        didUpdateWidget: didUpdateWidget,
        builder: (controller) {
          return Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomInset: _resizeToAvoidBottomInset,
            appBar: appToolbar(context),
            body: buildBody(context, controller),
            endDrawer: endDrawer(),
            onEndDrawerChanged: onEndDrawerChanged,
            onDrawerChanged: onDrawerChanged,
            endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture(),
            floatingActionButton: floatingActionButton(),
            bottomNavigationBar: bottomNavigationBar(),
          );
        });
  }
}
