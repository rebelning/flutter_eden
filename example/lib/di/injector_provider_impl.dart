import 'package:example/domain/repositories/impl/login_repository_impl.dart';
import 'package:example/domain/service/login_service.dart';
import 'package:example/ui/login/login_view_model.dart';
import 'package:flutter_eden/eden.dart';

///setup inject
Future<void> setupInjectionImpl() async {

  ///
  inject.registerFactory(() => LoginService());
  ///repositories
  inject.registerFactory(() => LoginRepository());

  ///login view model
  inject.registerLazySingleton(() => LoginViewModel());
}
