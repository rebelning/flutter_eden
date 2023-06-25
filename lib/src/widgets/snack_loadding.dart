import 'package:flutter/cupertino.dart';
import 'package:flutter_eden/eden.dart';

Future<T> showOverlayLoading<T>(Future<T> Function() asyncFunction,
    {barrierDismissible = false,
    Duration duration = const Duration(seconds: 15)}) async {
  Get.dialog(
    Center(
      child: Container(
        height: 250.rpx,
        width: 250.rpx,
        child: const _CustomLoadWidget(
          loadingText: "加载中...",
        ),
      ),
    ),
    barrierDismissible: barrierDismissible,
  ).then((value) {});

  print("kIsOverlaysOpen=$kIsOverlaysOpen");
  T data;
  try {
    data = await asyncFunction();
  } on Exception catch (_) {
    hideLoadding();
    rethrow;
  } finally {
    hideLoadding();
  }
  return data;
}

void hideLoadding() {
  print("hideLoadding....");
  if (kIsOverlaysOpen) {
    EdenRoute.back();
  }
}

class _CustomLoadWidget extends StatefulWidget {
  final CancelFunc? cancelFunc;
  final String? loadingText;

  const _CustomLoadWidget({
    Key? key,
    this.cancelFunc,
    this.loadingText,
  }) : super(key: key);

  @override
  _CustomLoadWidgetState createState() => _CustomLoadWidgetState();
}

class _CustomLoadWidgetState extends State<_CustomLoadWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0x99000000),
      child: Padding(
        padding: EdgeInsets.only(
            left: 50.rpx, top: 50.rpx, right: 50.rpx, bottom: 50.rpx),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Theme(
              data: Theme.of(Get.context!).copyWith(
                cupertinoOverrideTheme: const CupertinoThemeData(
                  brightness: Brightness.dark,
                ),
              ),
              child: SizedBox(
                width: 50.rpx,
                height: 50.rpx,
                child: defaultTargetPlatform == TargetPlatform.iOS
                    ? const CupertinoActivityIndicator()
                    : const CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.blue,
                        strokeWidth: 2.0),
              ),
            ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 30.rpx),
              child: Text(
                widget.loadingText ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.rpx,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
