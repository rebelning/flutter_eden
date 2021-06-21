import 'base_url.dart' as BASE_URL;

class _Login {
  final login = BASE_URL.HTTP_DOMAIN + "/auth/login";
}

class _AppList {
  final menuList = BASE_URL.HTTP_DOMAIN + "/config/menulist";
  final messageList = BASE_URL.HTTP_DOMAIN + "/config/messagelist";
}

final login = _Login();
final appList = _AppList();
