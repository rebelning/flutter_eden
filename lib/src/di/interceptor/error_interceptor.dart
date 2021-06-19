import 'package:dio/dio.dart';
import 'package:flutter_eden/eden.dart';

///token interceptor
class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    DebugLog.log("********error*********", "${err.message}");
  }
}
