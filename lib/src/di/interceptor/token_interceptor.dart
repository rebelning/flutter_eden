import 'package:dio/dio.dart';
import 'package:flutter_eden/src/cache/storage.helper.dart';
///token interceptor
class TokenInterceptor extends InterceptorsWrapper {
    @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    super.onRequest(options, handler);
    final storageToken = await StorageHelper.get(StorageKeys.token);
    if (storageToken != null)
      options.headers.addAll({
        "Authorization": 'Bearer $storageToken',
      });
    }
}

