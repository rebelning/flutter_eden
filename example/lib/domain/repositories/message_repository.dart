import 'package:example/domain/http_response.dart';

abstract class IMessageRepository{

  Future<HttpResponse> getMessageList();
}