import 'package:example/domain/models/message.dart';
import 'package:example/domain/repositories/impl/message_repository_impl.dart';
import 'package:flutter_eden/eden.dart';

class MessageViewModel extends BaseViewModel {
  final vm = inject<MessageRepository>();
  final _messageList = BehaviorSubject<List<Message>?>.seeded(null);

  Stream<List<Message>?> get messageList => _messageList.stream ;

  void setMessageList(List<Message> value) => _messageList.add(value);

  Future<bool> getMessageList() async {
    HttpResponse<List<Message>> response = await vm.getMessageList();
    if (response.resCode == 200) {
      setMessageList(response.data as List<Message>);
      return true;
    }
    return false;
  }

  @override
  void clear() {}
}
