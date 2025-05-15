import 'dart:io';

import 'package:flutter_eden/eden.dart';

import 'proxy_setting_widget.dart';

///proxy setting
class ProxySettingPage extends StatefulWidget {
  const ProxySettingPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProxySettingPageState();
}

///
class _ProxySettingPageState extends State<ProxySettingPage>
    with ProxySettingWidget {
  // SettingsProvider? settingProvider;
  String? _proxyIP;
  String? _proxyPort;
  @override
  void initState() {
    super.initState();
    _getProxy();
  }

  void _getProxy() async {
    _proxyIP = await StorageHelper.get(StorageKeys.proxyIP);
    _proxyPort = await StorageHelper.get(StorageKeys.proxyPort);
    initView(_proxyIP, _proxyPort);
  }

  ///
  void onCallProxy(String? proxyIp, String? proxyPort) {
    debugPrint("proxyIp=$proxyIp proxyPort=$proxyPort");

    ///
    showLoading(onCacheProxy(proxyIp, proxyPort));
  }

  Future onCacheProxy(String? proxyIp, String? proxyPort) async {
    StorageHelper.set(StorageKeys.proxyIP, proxyIp ?? "");
    StorageHelper.set(StorageKeys.proxyPort, proxyPort ?? "");

    // SettingsProvider
    // settingProvider?.setProxy(prefs);
    await Future.delayed(const Duration(milliseconds: 2000));
    showExitDialog();
  }

  void showExitDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CustomDialog(
          titleText: "提示",
          contentText: "代理设置成功，重启应用生效",
          confirmText: "重启",
          cancelText: "取消",
          confirmTap: () {
            EdenRoute.back();
            _exitReset();
          },
        );
      },
    );
  }

  void _exitReset() async {
    if (Platform.isIOS) {
      exit(0);
    } else {
      await SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    ///
    // settingProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: ToolbarWidget(
        title: "Proxy setting",
        backgroundColor: kIsDark ? toolBarbgColor : toolBarbgLightColor,
      ),
      backgroundColor: kIsDark ? backgroundColor : backgroundLightColor,
      body: renderView(context, onCallProxy),
    );
  }

  @override
  void dispose() {
    super.dispose();
    disposeView();
  }
}
