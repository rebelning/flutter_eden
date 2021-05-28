import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_eden/src/cache/storage.helper.dart';

class HttpClient {
  static bool _debug = kDebugMode;
  Dio _client;
  int connectTimeout = 5000; //5s
  int receiveTimeout = 5000; //5s
  HttpClient() {
    _client = Dio();
    _client.options.connectTimeout = connectTimeout;
    _client.options.receiveTimeout = receiveTimeout;
    _client.interceptors.add(_interceptor());
    _client.interceptors.add(LogInterceptor(
        request: _debug,
        requestBody: _debug,
        responseBody: _debug,
        requestHeader: _debug,
        responseHeader: _debug));
  }

  Interceptor _interceptor() {
    return InterceptorsWrapper(onRequest: (RequestOptions request) async {
      final storageToken = await StorageHelper.get(StorageKeys.token);

      if (storageToken != null)
        request.headers.addAll({
          "Authorization": 'Bearer $storageToken',
        });

      return request;
    });
  }

  Future<Response> get(String url) => _client.get(url);

  Future<Response> post(String url, {dynamic body}) =>
      _client.post(url, data: body);

  Future<Response> put(String url, {dynamic body}) =>
      _client.put(url, data: body);

  Future<Response> delete(String url, {dynamic body}) => _client.delete(url);
}
