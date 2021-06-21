import 'package:example/domain/models/message.dart';
import 'package:example/domain/repositories/message_repository.dart';
import 'package:example/domain/service/message_service.dart';
import 'package:flutter_eden/eden.dart';

class MessageRepository implements IMessageRepository {
  MessageService _service = inject<MessageService>();

  @override
  Future<HttpResponse<List<Message>>> getMessageList() async {
    HttpResponse<List<Message>> response = HttpResponse();

    response = await this._service.getMessageList();

    return response;
  }
}
