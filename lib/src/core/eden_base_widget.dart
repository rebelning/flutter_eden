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
  Color? backgroundColor() {
    return Color(0xffF8F8F8);
  }

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

  List<Widget>? toolbarActions() {
    return [];
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
            title: _toolbarTitle ?? toolbarTitle(),
            color: toolbarTitleColor,
            actions: toolbarActions(),
            fontSize: 35.rpx,
            fontWeight: FontWeight.w500,
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
            appBar: appToolbar(context),
            body: buildBody(context, controller),
            backgroundColor: backgroundColor(),
            floatingActionButton: floatingActionButton(),
            bottomNavigationBar: bottomNavigationBar(),
          );
        });
  }
}
