import 'package:flutter_eden/eden.dart';

class EdenSnackbar {
  EdenSnackbar(
    String message, {
    String? title,
    bool? error,
    Function? action,
    String? actionMessage,
  }) {
    Get.snackbar(
      title ?? "Message",
      message,
      colorText: kIsDark ? snackBarTextColor : snackBarTextLightColor,
      backgroundColor: kIsDark ? snackBarColor : snackBarLightColor,
    );
  }
}

void closeAllSnackbars() {
  if (kIsSnackbarOpen) {
    Get.closeAllSnackbars();
  }
}
