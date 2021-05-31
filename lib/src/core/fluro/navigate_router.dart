import 'package:flutter/cupertino.dart';
import 'package:flutter_eden/eden.dart';

///
class NavigateRouter {
  Future navigateTo(BuildContext context, String path) {
    return Application.router?.navigateTo(context, path);
  }

  void pop<T>(BuildContext context,[T result]){
     Application.router?.pop(context,result);
  }
}
