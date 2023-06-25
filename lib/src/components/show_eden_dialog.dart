import 'package:flutter_eden/eden.dart';

Future<T?> showEdenDialog<T>(
  Widget widget, {
  barrierDismissible = false,
}) {
  return Get.dialog<T>(widget);
}
