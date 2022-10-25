import 'package:flutter_eden/eden.dart';

class DemoButtonController extends EdenBaseController {
  @override
  void init() {}

  void showSnackbar() {
    EdenSnackbar("showSnackbar..");
  }

  void showLoad() {
    showLoading(_loading());
    // showOverlayLoading(_loading);
  }

  Future _loading() async {
    return await Future.delayed(const Duration(seconds: 5));
  }

  @override
  void dealloc() {}
}
