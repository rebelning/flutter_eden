import 'package:example/domain/http_response.dart';
import 'package:example/domain/repositories/impl/account_repository_impl.dart';
import 'package:flutter_eden/eden.dart';
import 'package:example/domain/models/menu.dart';
import 'package:rxdart/subjects.dart';

class AccountViewModel extends BaseViewModel {
  AccountRepository _accountRepository = inject<AccountRepository>();
  final _menuList = BehaviorSubject<List<Menu>>.seeded([]);

  Stream get menuList => _menuList.stream;

  void setMenuList(List<Menu> value) => _menuList.add(value);

  Future<bool> getMenuList() async {
    setLoading(true);
    HttpResponse response = await _accountRepository.getMenuList();

    await Future.delayed(Duration(seconds: 1));
    setLoading(false);
    if (response.resCode == 200) {
      setMenuList(response.data);
      return true;
    }
    return false;
  }

  @override
  void clear() {}
}
