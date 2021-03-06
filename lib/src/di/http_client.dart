import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_eden/src/di/interceptor/auth_interceptor.dart';
import 'package:flutter_eden/src/di/interceptor/error_interceptor.dart';
import 'package:flutter_eden/src/di/interceptor/token_interceptor.dart';

class HttpClient {
  static bool _debug = kDebugMode;
  late Dio _client;
  int connectTimeout = 5000; //5s
  int receiveTimeout = 5000; //5s
  HttpClient() {
    _client = Dio();
    _client.options = BaseOptions(
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        responseType: ResponseType.json);

    ///
    _client.interceptors.add(TokenInterceptor());
    _client.interceptors.add(AuthInterceptor());
    _client.interceptors.add(ErrorInterceptor());
    _client.interceptors.add(LogInterceptor(
        request: _debug,
        requestBody: _debug,
        responseBody: _debug,
        requestHeader: _debug,
        responseHeader: _debug));
  }


  Future<Response> get(String url) => _client.get(url);

  Future<Response> post(String url, {dynamic body}) =>
      _client.post(url, data: body);

  Future<Response> put(String url, {dynamic body}) =>
      _client.put(url, data: body);

  Future<Response> delete(String url, {dynamic body}) => _client.delete(url);
}
