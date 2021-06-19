import 'package:get_it/get_it.dart';

import 'http_client.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {
  //Components
  inject.registerSingleton(HttpClient());
  ///globalKey

  //Remote Services
  // inject.registerFactory(() => AuthService());
  // inject.registerFactory(() => UserService());
  //
  // //Repositories
  // inject.registerFactory(() => AuthRepository());
  //
  // //ViewModels
  // inject.registerLazySingleton(() => LoginViewModel());
  // inject.registerLazySingleton(() => HomeViewModel());
}
