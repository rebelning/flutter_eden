
import 'base_url.dart' as BASE_URL;

class _Login {
  final login = BASE_URL.HTTP_DOMAIN + "/eden/auth/login";
}

class _AppList {
  final appList = BASE_URL.HTTP_DOMAIN + "/eden/menu/apps";
}

final login = _Login();
final appList = _AppList();
