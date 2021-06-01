import 'package:example/domain/models/message.dart';
import 'package:example/ui/message/message_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_eden/eden.dart';

class MessageWidget {
  final vm = inject<MessageViewModel>();

  Widget messageView() {
    return StreamBuilder(
        stream: vm.messageList,
        builder: (context, snapshot) {
          List<Message> msgList = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              return Container();
            },
            itemCount: msgList?.length,
          );
        });
  }
}
