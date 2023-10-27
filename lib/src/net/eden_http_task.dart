import 'package:flutter_eden/eden.dart';

abstract class HttpTask<T> extends GetConnect {
  ///
  bool? needToken() {
    return true;
  }

  ///
  bool? isCustomResp() {
    return false;
  }

  ///unauthorized
  void _unauthorized() {
    if (EdenHttpHook.unauthorizedCallback != null) {
      EdenHttpHook.unauthorizedCallback!();
    }
  }

  void _onError(int? statusCode, String? error) {
    if (EdenHttpHook.onErrorValue != null) {
      EdenHttpHook.onErrorValue!(error);
    }
    if (EdenHttpHook.onErrorStatusCode != null) {
      EdenHttpHook.onErrorStatusCode!(statusCode);
    }
  }

  void _onCustomResp(Response response) {
    if (EdenHttpHook.onCustomResponse != null) {
      EdenHttpHook.onCustomResponse!(response);
    }
  }

  String? _token() {
    if (EdenHttpHook.token != null) {
      return EdenHttpHook.token!();
    }
    return "";
  }

  Map<String, String> _headers() {
    if (EdenHttpHook.headers != null) {
      return EdenHttpHook.headers!();
    }
    return {};
  }

  String? _onFindProxy() {
    if (EdenHttpHook.onFindProxy != null) {
      return EdenHttpHook.onFindProxy!();
    }
    return null;
  }

  @override
  String Function(Uri url)? get findProxy => EdenHttpHook.onFindProxy == null
      ? super.findProxy
      : (uri) {
          return _onFindProxy() ?? "";
        };

  @override
  void onInit() {
    print("HttpTask-onInit...");
    if (EdenHttpHook.onFindProxy != null) {
      allowAutoSignedCert = true;
    } else {
      allowAutoSignedCert = false;
    }
    _interceptor();
    super.onInit();
  }

  void _interceptor() {
    httpClient.addRequestModifier<T?>((request) {
      // print("addRequestModifier...");
      request.headers['Authorization'] = _token() ?? "";
      request.headers.addAll(_headers());
      return request;
    });

    httpClient.addResponseModifier<T?>((request, response) {
      if (isCustomResp() == true) {
        _onCustomResp(response);
      } else {
        if (response.hasError) {
          print("${response.status.code}");
          if (response.unauthorized) {
            _unauthorized();
          } else {
            if (response.body is EdenHttpResponse) {
              EdenHttpResponse? res = response.body as EdenHttpResponse;
              _onError(
                response.statusCode,
                res.message,
              );
            } else {
              _onError(
                response.statusCode,
                response.statusText,
              );
            }
          }
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
