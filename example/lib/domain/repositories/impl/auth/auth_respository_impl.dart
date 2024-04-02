import 'package:example/domain/entity/net_checked_model.dart';
import 'package:example/domain/repositories/auth_respository.dart';
import 'package:example/domain/repositories/impl/auth/auth_provider.dart';
import 'package:flutter_eden/eden.dart';

class AuthRespositoryImpl extends EdenBaseRepository
    implements IAuthRespository {
  final IAuthProvider provider;
  AuthRespositoryImpl({
    required this.provider,
  });
  @override
  Future<NetCheckedModel?> doNetChecked() async {
    return getRepository<NetCheckedModel>(provider.doNetChecked());
    // final authChecked = await provider.doNetChecked();
    // if (authChecked.hasError) {
    //   return Future.error(authChecked.statusText ?? "");
    // } else {
    //   return authChecked.body;
    // }
  }
}
