import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter_eden/eden.dart';

/// 打开loading
///
/// 返回cancelFunc，调用它，关闭loading
///
/// 例子：
/// * var cancelLoading = showCustomLoading(); // 打开loading
/// * // 执行一系列操作
/// * await future1;
/// * await future2;
/// * cancelLoading(); // 关闭loading
CancelFunc showCustomLoading(
    {Duration duration = const Duration(seconds: 15)}) {
  var loading = BotToast.showLoading(duration: duration);
  return loading;
}

/// 传入一个future，在future完成之前loading持续，future结束后，loading自动关闭
///
/// 返回future的结果
///
/// 例子：Response res = await showLoading(API.getxxx);
Future<T> showLoading1<T>(Future<T> future,
    {Duration duration = const Duration(seconds: 15)}) async {
  CancelFunc cancelFunc = BotToast.showLoading(duration: duration);

  try {
    T res = await future;
    return res;
  } catch (e) {
    throw e;
  } finally {
    cancelFunc();
  }
}

///
Future<T> showNewLoading<T>(
  Future<T> future, {
  String? desc = "加载中...",
  Duration duration = const Duration(seconds: 15),
}) async {
  future.then((value) {});
  CancelFunc cancelFunc = BotToast.showCustomLoading(
    toastBuilder: (_) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ///
              Theme(
                data: Theme.of(kContext!).copyWith(
                  cupertinoOverrideTheme: const CupertinoThemeData(
                    brightness: Brightness.dark,
                  ),
                ),
                child: defaultTargetPlatform == TargetPlatform.iOS
                    ? const CupertinoActivityIndicator()
                    : CircularProgressIndicator(strokeWidth: 2.0.rpx),
              ),
              SizedBox(height: 25.rpx),

              Text(
                "$desc",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.rpx,
                ),
              )
            ],
          ),
        ),
      );
    },
  );

  try {
    T res = await future;
    return res;
  } catch (e) {
    throw e;
  } finally {
    cancelFunc();
  }
}

///
Future<T> showProgressLoading<T>(
  StreamController<double>? streamController,
  Future<T> future,
) async {
  future.then((value) {});
  CancelFunc cancelFunc = BotToast.showCustomLoading(
    toastBuilder: (_) {
      return StreamBuilder<double>(
          stream: streamController?.stream,
          initialData: 0.15,
          builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
            return Container(
              decoration: const BoxDecoration(
                color: Color(0xff1A000000),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ///
                  Container(
                    margin: EdgeInsets.only(left: 200.rpx, right: 200.rpx),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(44.rpx)),
                      child: LinearProgressIndicator(
                        value: snapshot.data,
                        backgroundColor: const Color(0xffFFEFEB),
                        valueColor: const AlwaysStoppedAnimation(
                          Color(0xff1077FE),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.rpx),

                  Text(
                    "${snapshot.data == 1.0 ? "上传完成" : "上传中 ${NumberFormat("0").format((snapshot.data! * 100))}%..."}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.rpx,
                    ),
                  )
                ],
              ),
            );
          });
    },
  );

  try {
    T res = await future;
    return res;
  } catch (e) {
    throw e;
  } finally {
    cancelFunc();
    if (streamController?.isClosed == false) {
      streamController?.close();
    }
  }
}

///
Future<T> showLoading<T>(
  Future<T> future, {
  String? desc = "加载中...",
  Duration duration = const Duration(seconds: 15),
}) async {
  future.then((value) {});
  CancelFunc cancelFunc = BotToast.showCustomLoading(
    toastBuilder: (_) {
      return _CustomLoadWidget(cancelFunc: () {}, loadingText: desc);
    },
  );

  try {
    T res = await future;
    return res;
  } catch (e) {
    throw e;
  } finally {
    cancelFunc();
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
    // animationController = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 300));

    // animationController?.addStatusListener((AnimationStatus status) {
    //   if (status == AnimationStatus.completed) {
    //     animationController?.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     animationController?.forward();
    //   }
    // });
    // animationController?.forward();

    super.initState();
  }

  @override
  void dispose() {
    // animationController?.dispose();
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
            // FadeTransition(
            //   opacity: animationController!,
            //   child:

            ///
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
                "${widget.loadingText ?? ""}",
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
