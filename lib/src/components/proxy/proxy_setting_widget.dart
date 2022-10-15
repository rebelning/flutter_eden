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
      padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
      child: Column(
        children: [
          _renderServerItem(context, "服务器"),
          const SizedBox(height: 32),
          _renderProtItem(context, "端口"),
          const SizedBox(height: 64),
          _renderBtn(context, onProxy),
        ],
      ),
    );
  }

  ///
  Widget _renderServerItem(BuildContext context, String label) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              "$label",
              style: const TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 18,
                height: 1.4,
                fontWeight: FontWeight.bold,
              ),
            )),
        Expanded(
          flex: 4,
          child: InputWidget(
            // controller: _serverController,
            inputFormatters: [
              // WhitelistingTextInputFormatter(RegExp("[0123456789.]"))
              FilteringTextInputFormatter.allow(RegExp("[0123456789.]")),
            ],
            maxLength: 15,
            textAlign: TextAlign.end,
            keyboardType: TextInputType.datetime,
            // showBorder: false,
            placeholder: "192.168.1.1",
            onChange: (value) {
              proxyIP = value;
            },
          ),
        ),
      ],
    );
  }

  Widget _renderProtItem(BuildContext context, String label) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              "$label",
              style: const TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 18,
                height: 1.4,
                fontWeight: FontWeight.bold,
              ),
            )),
        Expanded(
          flex: 4,
          child: InputWidget(
            // controller: _portController,
            textAlign: TextAlign.end,
            keyboardType: TextInputType.phone,
            // showBorder: false,
            maxLength: 4,
            placeholder: "8888",
            onChange: (value) {
              proxyPort = value;
            },
          ),
        ),
      ],
    );
  }

  static ButtonStyle raisedButtonStyle(ThemeData theme) {
    return ElevatedButton.styleFrom(
      onPrimary: const Color(0xff2C83F),
      primary: theme.colorScheme.primary,
      minimumSize: Size(88, 44),
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
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
