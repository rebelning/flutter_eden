import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_eden/eden.dart';

class EdenHttpHook {
  static final EdenHttpHook _instance = EdenHttpHook._init();

  EdenHttpHook._init();

  factory EdenHttpHook() => _instance;

  static ValueGetter<String?>? _token;
  static ValueGetter<String?>? get token => _token;
  static setToken(ValueGetter<String?> onToken) {
    _token = onToken;
  }

  ///setting headers
  static ValueGetter<Map<String, String>>? _headers;
  static ValueGetter<Map<String, String>>? get headers => _headers;
  static setHeaders(ValueGetter<Map<String, String>> headers) {
    _headers = headers;
  }

  static ValueGetter<String?>? _findProxy;
  static ValueGetter<String?>? get onfindProxy => _findProxy;
  static Future setHttpProxy() async {
    final prefs = await SharedPreferences.getInstance();
    String? proxyIP = prefs.getString(StorageKeys.proxyIP);
    String? proxyPort = prefs.getString(StorageKeys.proxyPort);
    String? localProxy = "PROXY $proxyIP:$proxyPort";
    if (proxyIP?.isNotEmpty == true && proxyPort?.isNotEmpty == true) {
      localProxy = "PROXY $proxyIP:$proxyPort";
    } else {
      localProxy = null;
    }
    print("localProxy=$localProxy");
    if (localProxy != null) {
      _findProxy = () {
        return localProxy!;
      };
    }
    return null;
  }

  ///unauthorized
  static VoidCallback? _unauthorizedCallback;
  static VoidCallback? get unauthorizedCallback => _unauthorizedCallback;

  static setUnauthorized(VoidCallback? mUnauthorizedCallback) {
    _unauthorizedCallback = mUnauthorizedCallback;
  }

  ///
  static ValueChanged<dynamic>? _onValueChanged;
  static ValueChanged<dynamic>? get onValueChanged => _onValueChanged;

  static setValueChanged(ValueChanged<dynamic>? mOnValueChanged) {
    _onValueChanged = mOnValueChanged;
  }

  static ValueChanged<dynamic>? _onErrorValue;
  static ValueChanged<dynamic>? get onErrorValue => _onErrorValue;

  static setError(ValueChanged<dynamic>? mOnError) {
    _onErrorValue = mOnError;
  }
}
