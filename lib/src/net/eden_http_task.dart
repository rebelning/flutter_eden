import 'package:flutter_eden/eden.dart';

abstract class HttpTask<T> extends GetConnect {
  bool? needToken() {
    return true;
  }

  void close() {
    httpClient.close();
  }

  ///unauthorized
  void _unauthorized() {
    if (EdenHttpHook.unauthorizedCallback != null) {
      EdenHttpHook.unauthorizedCallback!();
    }
  }

  void _onError(String? error) {
    if (EdenHttpHook.onErrorValue != null) {
      EdenHttpHook.onErrorValue!(error);
    }
  }

  String? _token() {
    if (EdenHttpHook.token != null) {
      return EdenHttpHook.token!();
    }
  }

  String _onFindProxy() {
    if (EdenHttpHook.onfindProxy != null) {
      return EdenHttpHook.onfindProxy!();
    }
    return "";
  }

  @override
  String Function(Uri url)? get findProxy => EdenHttpHook.onfindProxy == null
      ? super.findProxy
      : (uri) {
          return _onFindProxy();
        };

  @override
  void onInit() {
    print("HttpTask-onInit...");
    _interceptor();
    super.onInit();
  }

  void _interceptor() {
    httpClient.addRequestModifier<T?>((request) {
      // print("addRequestModifier...");
      request.headers['Authorization'] = _token() ?? "";
      return request;
    });

    httpClient.addResponseModifier<T?>((request, response) {
      print("addResponseModifier...");

      if (response.hasError) {
        print("${response.status.code}");
        if (response.unauthorized) {
          _unauthorized();
        } else {
          _onError(response.statusText);
        }
      }
      return response;
    });

    // httpClient.addAuthenticator<T?>((request) async {
    //   print("addAuthenticator...");
    //   // final storageToken = await StorageHelper.get(StorageKeys.token);
    //   // request.headers['Authorization'] = "Bearer $storageToken";
    //   print("token=${token()}");
    //   if (needToken() == true) request.headers['Authorization'] = token() ?? "";
    //   return request;
    // });
    // httpClient.maxAuthRetries = 3;
  }
}
