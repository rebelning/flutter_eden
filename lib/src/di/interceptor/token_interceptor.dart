import 'package:dio/dio.dart';
import 'package:flutter_eden/eden.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future onError(DioError err) async {
    if (err.response != null && err.response.statusCode == 401) {
      DebugLog.log("Interceptor", "login");
    }
    return super.onError(err);
  }
}
