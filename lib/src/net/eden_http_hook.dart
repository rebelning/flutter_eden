import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_eden/eden.dart';

class EdenHttpHook {
  static final EdenHttpHook _instance = EdenHttpHook._init();

  EdenHttpHook._init();

  factory EdenHttpHook() => _instance;

  static ValueGetter<String?>? _token;
  static ValueGetter<String?>? get token => _token;
  void setToken(ValueGetter<String?> onToken) {
    _token = onToken;
  }

  static ValueGetter<String?>? _findProxy;
  static ValueGetter<String?>? get onfindProxy => _findProxy;
  Future setHttpProxy() async {
    final prefs = await SharedPreferences.getInstance();
    String? proxyIP = prefs.getString(StorageKeys.proxyIP);
    String? proxyPort = prefs.getString(StorageKeys.proxyPort);
    String? localProxy = "PROXY $proxyIP:$proxyPort";
    if (proxyIP?.isEmpty == true || proxyPort?.isEmpty == true) {
      localProxy = null;
    }
    print("localProxy=$localProxy");
    if (localProxy != null) {
      _findProxy = () {
        return localProxy;
      };
    }
  }

  ///unauthorized
  static VoidCallback? _unauthorizedCallback;
  static VoidCallback? get unauthorizedCallback => _unauthorizedCallback;

  void setUnauthorized(VoidCallback? mUnauthorizedCallback) {
    _unauthorizedCallback = mUnauthorizedCallback;
  }

  ///
  ValueChanged<dynamic>? _onValueChanged;
  ValueChanged<dynamic>? get onValueChanged => _onValueChanged;

  void setValueChanged(ValueChanged<dynamic>? mOnValueChanged) {
    _onValueChanged = mOnValueChanged;
  }

  static ValueChanged<dynamic>? _onErrorValue;
  static ValueChanged<dynamic>? get onErrorValue => _onErrorValue;

  void setError(ValueChanged<dynamic>? mOnError) {
    _onErrorValue = mOnError;
  }
}
