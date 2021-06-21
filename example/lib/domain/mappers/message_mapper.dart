import 'package:example/domain/models/message.dart';

class MessageMapper {
  static List<Message> fromJsonList(List<dynamic> json) =>
      json.map((i) => fromJson(i)).toList();

  static Message fromJson(Map<String, dynamic> json) {
    return Message(
      msgId: json["msgId"] ,
      title: json["title"],
      content: json["content"],
    );
  }
}
