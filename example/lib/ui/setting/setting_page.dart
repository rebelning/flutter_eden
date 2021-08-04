import 'package:example/ui/setting/setting_view_model.dart';
import 'package:example/ui/setting/setting_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';

class SettingPage extends AbstractCoreStreamWidget {
  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends AbstractCoreStreamWidgetState<SettingPage> with SettingWidget{
  final vm = inject<SettingViewModel>();

 
  @override
  bool getHideToolbar() {
    return false;
  }

  @override
  bool getHideToolbarArrowBack() {
    return false;
  }

  @override
  Stream<LoadingMessage> getStream() {
    return vm.loading;
  }

  @override
  String getToolbarTitle() {
    return "setting";
  }

  @override
  void initData() {}
 @override
  Widget buildBody(BuildContext context) {
    
    return  setting(context);
  }

  @override
  void dealloc() {}
}
