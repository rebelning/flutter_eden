import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_eden/src/values/color/colors.dart' as colors;
import 'package:flutter_eden/src/values/dimen/dimens.dart' as dimens;

class ToastWidget {
  static void show(String msg) => Fluttertoast.showToast(
      // msg: msg "Toast message",
      msg: msg ,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colors.toastBackgroundColor,
      textColor: colors.toastTextColor,
      fontSize: dimens.fontText);

  static void cancelAll() => Fluttertoast.cancel();
}
