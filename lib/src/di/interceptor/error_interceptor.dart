import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flutter_eden/src/di/error_client.dart';

///token interceptor
class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    DebugLog.log("********error*********", "${err.message}");
    SnackMessage snackMessage = SnackMessage();
    snackMessage.resCode = err.response?.statusCode;
    snackMessage.message = err.message;
    final error = inject<ErrorClient>();
    error.setSnackMessage(snackMessage);
    // error.setSnackClear();


  }
}
