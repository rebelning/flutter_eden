import 'package:flutter_eden/eden.dart';

///
abstract class EdenBaseServiceWidget<T extends EdenBaseService>
    extends GetView<T> {
  EdenBaseServiceWidget({Key? key}) : super(key: key);

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

  /// toolbar title color
  Color toolbarTitleColor(BuildContext context) =>
      Theme.of(context).colorScheme.onPrimary;

  void setToolbarTitle(String? toolbarTitle) {
    _toolbarTitle = toolbarTitle;
  }

  ///toolbar arrow back
  Widget toolbarArrowBack() {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {},
    );
  }

  ///
  PreferredSizeWidget? appbar(BuildContext context) {
    return hideToolbar()
        ? null
        : ToolbarWidget(
            hideBackArrow: hideToolbarArrowBack(),
            title: _toolbarTitle ?? toolbarTitle(),
            color: toolbarTitleColor(context),
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
    return Scaffold(
      appBar: appbar(context),
      body: buildBody(context, controller),
      floatingActionButton: floatingActionButton(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
