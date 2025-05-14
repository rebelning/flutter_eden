import 'package:example/domain/entity/net_checked_model.dart';

abstract class IAuthRepository {
  Future<NetCheckedModel?> doNetChecked();
}
