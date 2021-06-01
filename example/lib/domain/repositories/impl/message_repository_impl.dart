import 'package:example/domain/http_response.dart';
import 'package:example/domain/repositories/message_repository.dart';
import 'package:example/domain/service/message_service.dart';
import 'package:flutter_eden/eden.dart';

class MessageRepository implements IMessageRepository {
  MessageService _service = inject<MessageService>();

  @override
  Future<HttpResponse> getMessageList() async {
    HttpResponse response = HttpResponse();

    response = await this._service.getMessageList();

    return response;
  }
}
