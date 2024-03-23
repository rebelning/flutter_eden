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
    bool? showCloseButton = false,
    double? iconSize,
  }) {
    Get.snackbar(
      title ?? "Message",
      message,
      colorText: kIsDark ? snackBarTextColor : snackBarTextLightColor,
      backgroundColor: kIsDark ? snackBarColor : snackBarLightColor,
      maxWidth: maxWidth,
      snackPosition: snackPosition,
      margin: margin,
      mainButton: mainButton ??
          (showCloseButton == true
              ? TextButton(
                  onPressed: () {
                    closeAllSnackbars();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: iconSize ?? 30,
                  ),
                )
              : null),
    );
  }
}

void closeAllSnackbars() {
  if (kIsSnackbarOpen) {
    Get.closeAllSnackbars();
  }
}
