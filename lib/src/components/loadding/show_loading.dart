import 'dart:async';

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
Future<T> showLoading<T>(Future<T> future,
    {Duration duration = const Duration(seconds: 15)}) async {
  CancelFunc cancelFunc = BotToast.showLoading(duration: duration);

  try {
    T res = await future;
    return res;
  } catch (e) {
    rethrow;
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
                color: Color(0xff1a000000),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ///
                  Container(
                    margin: const EdgeInsets.only(left: 200, right: 200),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(22)),
                      child: LinearProgressIndicator(
                        value: snapshot.data,
                        backgroundColor: const Color(0xffFFEFEB),
                        valueColor: const AlwaysStoppedAnimation(
                          Color(0xff1077FE),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Text(
                    snapshot.data == 1.0
                        ? "上传完成"
                        : "上传中 ${NumberFormat("0").format((snapshot.data! * 100))}%...",
                    style: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 30,
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
    rethrow;
  } finally {
    cancelFunc();
    if (streamController?.isClosed == false) {
      streamController?.close();
    }
  }
}
