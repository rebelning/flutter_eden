import 'package:example/domain/http_response.dart';
import 'package:example/domain/models/user.dart';
import 'package:example/domain/repositories/impl/login_repository_impl.dart';
import 'package:flutter_eden/eden.dart';
import 'package:rxdart/rxdart.dart';

///Login viewModel
class LoginViewModel extends BaseViewModel {
  ///
  LoginRepository? repository = inject<LoginRepository>();
  final _isLogin = BehaviorSubject<bool>.seeded(false);
  final _login = BehaviorSubject<String>.seeded("");
  final _password = BehaviorSubject<String>.seeded("");
  final _userInfo = BehaviorSubject<User?>.seeded(null);

  Stream<bool?> get isLogin => _isLogin.stream;

  void setIsLogin(bool value) => _isLogin.add(value);

  Stream<String?> get login => _login.stream;

  void setLogin(String value) => _login.add(value);

  Stream<String?> get password => _password.stream;

  void setPassword(String value) => _password.add(value);

  Stream<User?> get userInfo => _userInfo.stream;

  void setUserInfo(User? value) => _userInfo.add(value);

  Future<bool> signIn() async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 1));
    HttpResponse<User>? ret =
        await repository?.login(_login.value, _password.value);
    setLoading(false);
    if (ret?.resCode == 200) {
      setIsLogin(true);
      setUserInfo(ret?.data);
      clear();
      return true;
    }

    return false;
  }

  @override
  void clear() {
    _login.add("");
    _password.add("");
  }
}
