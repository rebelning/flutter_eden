import 'package:flutter_eden/eden.dart';

abstract class HttpTask<T> extends GetConnect {
  bool? needToken() {
    return true;
  }

  ///unauthorized
  void unauthorized() {
    if (HttpHook.unauthorizedCallback != null) {
      HttpHook.unauthorizedCallback!();
    }
  }

  void onError(String? error) {
    if (HttpHook.onErrorValue != null) {
      HttpHook.onErrorValue!(error);
    }
  }

  String? token() {
    if (HttpHook.token != null) {
      return HttpHook.token!();
    }
  }

  @override
  void onInit() {
    print("HttpTask-onInit...");
    _interceptor();
    super.onInit();
  }

  void _interceptor() {
    httpClient.addRequestModifier<T?>((request) {
      // print("addRequestModifier...");
      request.headers['Authorization'] = token() ?? "";
      return request;
    });

    httpClient.addResponseModifier<T?>((request, response) {
      print("addResponseModifier...");

      if (response.hasError) {
        print("${response.status.code}");
        if (response.unauthorized) {
          unauthorized();
        } else {
          onError(response.statusText);
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
