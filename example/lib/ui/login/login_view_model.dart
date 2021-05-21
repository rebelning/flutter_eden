import 'package:example/domain/http_response.dart';
import 'package:example/domain/repositories/impl/login_repository_impl.dart';
import 'package:flutter_eden/eden.dart';
import 'package:rxdart/rxdart.dart';

///Login viewModel
class LoginViewModel extends BaseViewModel {
  ///
  LoginRepository repository = inject<LoginRepository>();

  final _login = BehaviorSubject<String>.seeded("");
  final _password = BehaviorSubject<String>.seeded("");

  Stream get login => _login.stream;

  void setLogin(String value) => _login.add(value);

  Stream get password => _password.stream;

  void setPassword(String value) => _password.add(value);

  Future<bool> signIn() async {
    setLoading(true);

    await Future.delayed(Duration(seconds: 1));

    HttpResponse ret = await repository.login(_login.value, _password.value);

    setLoading(false);
    if (ret.statusCode == 200) {
      clear();
      return true;
    }

    return false;
  }

  @override
  void clear() {}
}
