import 'package:example/domain/http_response.dart';
import 'package:example/domain/mappers/message_mapper.dart';
import 'package:example/domain/models/message.dart';
import 'package:flutter_eden/eden.dart';
import 'package:example/domain/base/end_points.dart' as EndPoints;

class MessageService {
  HttpClient client = inject<HttpClient>();

  Future<HttpResponse<List<Message>>> getMessageList() async {
    HttpResponse<List<Message>> response = HttpResponse();
    String url = EndPoints.appList.messageList;

    final resMsg = client.get(url);
    resMsg.then((res) {
      response.resCode = res.statusCode!;
      response.data = MessageMapper.fromJsonList(res.data["data"]);
      response.message = res.data["message"];
    }).catchError((onError) {
      response.resCode = 500;
      response.message = onError.toString();
    });

    return response;
  }
}
