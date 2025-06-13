import 'package:flutter_eden/eden.dart';

mixin EdenBaseMixin<T extends EdenBaseController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState>? getScaffoldKey() => _scaffoldKey;

  bool hideToolbar() => false;
  bool hideToolbarArrowBack() => false;
  String toolbarTitle() => "";
  Color? toolbarTitleColor() => null;
  Color? toolbarBackgroundColor() => null;
  IconThemeData? iconTheme() => null;
  IconThemeData? actionsIconTheme() => null;
  bool? resizeToAvoidBottomInset() => null;
  List<Widget>? toolbarActions() => [];
  Widget? toolbarLeading() => null;
  double? leadingWidth() => null;
  double? toolbarHeight() => null;
  @protected
  Widget toolbarArrowBack() {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {},
    );
  }

  @protected
  PreferredSizeWidget? appToolbar(BuildContext context) {
    return hideToolbar()
        ? null
        : ToolbarWidget(
            centerTitle: true,
            backgroundColor: toolbarBackgroundColor(),
            hideBackArrow: hideToolbarArrowBack(),
            iconTheme: iconTheme(),
            actionsIconTheme: actionsIconTheme(),
            title: toolbarTitle(),
            color: toolbarTitleColor(),
            leading: toolbarLeading(),
            leadingWidth: leadingWidth(),
            toolbarHeight: toolbarHeight(),
            actions: toolbarActions(),
          );
  }

  void openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  void closeEndDrawer() {
    _scaffoldKey.currentState?.closeEndDrawer();
  }

  @protected
  bool endDrawerEnableOpenDragGesture() => true;
  @protected
  void onEndDrawerChanged(bool changed) {}
  @protected
  void onDrawerChanged(bool changed) {}

  bool extendBodyBehindAppBar() => false;
  @protected
  Color? backgroundColor() => null;
  @protected
  String? getViewTag() => null;
  @protected
  bool autoRemove() => true;
  @protected
  bool assignId() => false;
  @protected
  Widget buildBody(BuildContext context, T controller);
  @protected
  Widget? bottomNavigationBar() => null;
  @protected
  Widget? floatingActionButton() => null;
  @protected
  Widget? endDrawer() => null;
  @protected
  Widget renderHeadView(BuildContext context) => const SizedBox.shrink();
  @protected
  Widget buildScaffold(BuildContext context, T controller) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: extendBodyBehindAppBar(),
      backgroundColor: backgroundColor(),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset() ?? true,
      appBar: appToolbar(context),
      body: buildCustomScaffoldLayout(context, controller),
      endDrawer: endDrawer(),
      onEndDrawerChanged: endDrawer() != null ? onEndDrawerChanged : null,
      onDrawerChanged: onDrawerChanged,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture(),
      floatingActionButton: floatingActionButton(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  @protected
  Widget buildCustomLayout(BuildContext context, T controller) {
    return Container(
      color: backgroundColor(),
      child: Column(
        children: [
          renderHeadView(context),
          Expanded(
            child: buildBody(context, controller),
          ),
          if (bottomNavigationBar() != null) bottomNavigationBar()!,
        ],
      ),
    );
  }

  @protected
  Widget buildCustomScaffoldLayout(BuildContext context, T controller) {
    return Container(
      color: backgroundColor(),
      child: Column(
        children: [
          renderHeadView(context),
          Expanded(
            child: buildBody(context, controller),
          ),
        ],
      ),
    );
  }

  void onInit() {}
  void onClose() {}
}
