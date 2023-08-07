import 'package:flutter_eden/eden.dart';

///
abstract class EdenBaseWidget<T extends EdenBaseController> extends GetView<T> {
  EdenBaseWidget({Key? key}) : super(key: key);

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

  Widget? toolbarLeading() {
    return null;
  }

  double? leadingWidth() {
    return null;
  }

  double? toolbarHeight() {
    return null;
  }

  ///toolbar arrow back
  Widget toolbarArrowBack() {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {},
    );
  }

  ///
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
  Widget buildBody(BuildContext context, T _controller);

  ///bottom navigation bar
  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? floatingActionButton() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
        init: controller,
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: _resizeToAvoidBottomInset,
            appBar: appToolbar(context),
            body: buildBody(context, controller),
            floatingActionButton: floatingActionButton(),
            bottomNavigationBar: bottomNavigationBar(),
          );
        });
  }
}
