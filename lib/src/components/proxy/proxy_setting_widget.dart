import 'package:flutter/services.dart';
import 'package:flutter_eden/eden.dart';

class ProxySettingWdiget {
  TextEditingController _serverController = TextEditingController();
  TextEditingController _portController = TextEditingController();

  ///
  Function(String? proxyIp, String? proxyPort)? onProxy;

  String? proxyIP;
  String? proxyPort;

  ///
  void initView(String? ip, String? port) {
    _serverController.text = ip ?? "";
    _portController.text = port ?? "";
    proxyIP = ip;
    proxyPort = port;
    _serverController.addListener(() {
      proxyIP = _serverController.text.trim();
    });
    _portController.addListener(() {
      proxyPort = _portController.text.trim();
    });
  }

  ///
  Widget renderView(BuildContext context,
      Function(String? proxyIp, String? proxyPort)? onProxy) {
    return Container(
      padding: EdgeInsets.only(left: 32.rpx, right: 32.rpx, top: 32.rpx),
      child: Column(
        children: [
          _renderServerItem(context, "服务器"),
          SizedBox(height: 40.rpx),
          _renderProtItem(context, "端口"),
          SizedBox(height: 64.rpx),
          _renderBtn(context, onProxy),
        ],
      ),
    );
  }

  ///
  Widget _renderServerItem(BuildContext context, String? label) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              "$label",
              style: TextStyle(
                color: kIsDark ? textColor : textLightColor,
                fontSize: 28.rpx,
                height: 1.4,
                fontWeight: FontWeight.bold,
              ),
            )),
        Expanded(
          flex: 4,
          child: InputWidget(
            controller: _serverController,
            inputFormatters: [
              // WhitelistingTextInputFormatter(RegExp("[0123456789.]"))
              FilteringTextInputFormatter.allow(RegExp("[0123456789.]")),
            ],
            maxLength: 15,
            textAlign: TextAlign.end,
            keyboardType: TextInputType.datetime,
            showBorder: false,
            placeholder: "192.168.1.1",
            onChanged: (value) {
              proxyIP = value;
            },
          ),
        ),
      ],
    );
  }

  Widget _renderProtItem(BuildContext context, String? label) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              "$label",
              style: TextStyle(
                color: kIsDark ? textColor : textLightColor,
                fontSize: 28.rpx,
                height: 1.4,
                fontWeight: FontWeight.bold,
              ),
            )),
        Expanded(
          flex: 4,
          child: InputWidget(
            controller: _portController,
            textAlign: TextAlign.end,
            keyboardType: TextInputType.phone,
            showBorder: false,
            maxLength: 4,
            placeholder: "8888",
            onChanged: (value) {
              proxyPort = value;
            },
          ),
        ),
      ],
    );
  }

  static ButtonStyle raisedButtonStyle(ThemeData theme) {
    return ElevatedButton.styleFrom(
      onPrimary: const Color(0xff2C83F5),
      primary: btnBackgroundColor,
      minimumSize: Size(200.rpx, 88.rpx),
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 16.rpx),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.rpx)),
      ),
    );
  }

  ///
  Widget _renderBtn(BuildContext context, onProxy) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: raisedButtonStyle(Theme.of(context)),
        onPressed: () {
          if (onProxy != null) {
            onProxy(proxyIP, proxyPort);
          }
        },
        child: const Text(
          "保存",
          style: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}
