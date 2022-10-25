import 'package:example/domain/domain.dart';
import 'package:example/domain/entity/net_checked_model.dart';
import 'package:flutter_eden/eden.dart';

abstract class IAuthProvider {
  Future<Response<NetCheckedModel>> doNetChecked();
}

class AuthProvider extends HttpTask implements IAuthProvider {
  @override
  Future<Response<NetCheckedModel>> doNetChecked() {
    final path = auth.netChecked;
    return get<NetCheckedModel>(
      path,
      decoder: (val) => NetCheckedModel.fromJson(val as Map<String, dynamic>),
    );
  }
}
