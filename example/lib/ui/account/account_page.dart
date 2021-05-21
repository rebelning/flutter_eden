import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_eden/eden.dart';

class AccountPage extends AbstractMvvmBase {
  @override
  State<StatefulWidget> createState() => AccountPageState();
}

class AccountPageState extends AbstractMvvmBaseState {
  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: TextWidget(
        text: "account",
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
  String getToolbarTitle() {
    return "Account";
  }
}
