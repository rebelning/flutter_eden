import 'package:dio/dio.dart';
import 'package:flutter_eden/eden.dart';

///Authorization
class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    //Authorization failure
    if (response.statusCode == 401) {
      //login
      DebugLog.log("AuthInterceptor", response.data);
    } else if (response.statusCode == 500) {//server error


    }
  }
}
