import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_eden/eden.dart';

class SettingPage extends AbstractCoreStreamWidget {
  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends AbstractCoreStreamWidgetState<SettingPage> {
  void _system(){
    
  }
  void _dark(){

  }
  void _light(){

  }
  @override
  Widget buildBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: _system,
            child: Container(
              child: TextWidget(
                text: "dart",
              ),
            ),
          ),
          InkWell(
            onTap: _dark,
            child: Container(
              child: TextWidget(
                text: "dart",
              ),
            ),
          ),
          InkWell(
            onTap: _light,
            child: Container(
              child: TextWidget(
                text: "dart",
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool getHideToolbar() {
    return false;
  }

  @override
  bool getHideToolbarArrowBack() {
    return false;
  }

 @override
  Stream<bool> getStream() {
    return null!;
  }

  @override
  String getToolbarTitle() {
    return "setting";
  }
  @override
  void initData() {
  }
  @override
  void dealloc() {
  }


}
