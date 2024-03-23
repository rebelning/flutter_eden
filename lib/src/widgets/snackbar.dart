import 'package:flutter_eden/eden.dart';

class EdenSnackbar {
  EdenSnackbar(
    String message, {
    String? title,
    bool? error,
    Function? action,
    String? actionMessage,
    double? maxWidth,
    TextButton? mainButton,
    SnackPosition? snackPosition,
    EdgeInsets? margin,
  }) {
    Get.snackbar(
      title ?? "Message",
      message,
      colorText: kIsDark ? snackBarTextColor : snackBarTextLightColor,
      backgroundColor: kIsDark ? snackBarColor : snackBarLightColor,
      maxWidth: maxWidth,
      mainButton: mainButton,
      snackPosition: snackPosition,
      margin: margin,
    );
  }
}

void closeAllSnackbars() {
  if (kIsSnackbarOpen) {
    Get.closeAllSnackbars();
  }
}
