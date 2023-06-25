import 'package:example/domain/entity/net_checked_model.dart';

abstract class IAuthRespository {
  Future<NetCheckedModel?> doNetChecked();
}
