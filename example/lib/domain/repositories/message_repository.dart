import 'package:flutter_eden/eden.dart';
abstract class IMessageRepository{

  Future<HttpResponse> getMessageList();
}