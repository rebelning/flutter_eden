import 'package:example/app/modules/message/controllers/message_controller.dart';
import 'package:flutter_eden/eden.dart';

class MessagePage extends EdenBaseWidget<MessageController> {
  @override
  String toolbarTitle() {
    return "hello world";
  }

  @override
  Widget buildBody(BuildContext context, MessageController _controller) {
    return Container();
  }
}
