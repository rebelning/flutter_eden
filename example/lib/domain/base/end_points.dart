// ignore: library_prefixes
import 'base_url.dart' as BASE_URL;

class _Auth {
  final netChecked = BASE_URL.HTTP_DOMAIN;
}

class _Login {
  final authLogin = BASE_URL.HTTP_DOMAIN + "/auth/login";
}

class _AppList {
  final menuList = BASE_URL.HTTP_DOMAIN + "/config/menulist";
  final messageList = BASE_URL.HTTP_DOMAIN + "/config/messagelist";
}

final auth = _Auth();
final login = _Login();
final appList = _AppList();
