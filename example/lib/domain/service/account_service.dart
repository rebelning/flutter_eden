import 'package:example/domain/http_response.dart';
import 'package:example/domain/mappers/menu_mapper.dart';

import 'package:flutter_eden/eden.dart';
import 'package:example/domain/base/end_points.dart' as EndPoints;

class AccountService {
  HttpClient client = inject<HttpClient>();

  Future<HttpResponse> getMenuList() async {
    HttpResponse response = HttpResponse();
    String url = EndPoints.appList.menuList;
    final ret = client.get(url);
    ret.then((res) {
      response.resCode = res.statusCode;
      // List<Map<String, dynamic>> tmpList = [
      //   {"id": 1, "section": "setting"},
      //   {"id": 2, "section": "setting"},
      //   {"id": 3, "section": "setting"},
      //   {"id": 4, "section": "setting"},
      //   {"id": 4, "section": "setting"},
      //   {"id": 4, "section": "setting"},
      //   {"id": 4, "section": "setting"},
      //   {"id": 4, "section": "setting"},
      // ];

      response.data = MenuMapper.fromJsonList(res.data["data"]);

    }).catchError((onError) {
      response.resCode = 500; //失败
      response.message = onError.toString();
    });

    DebugLog.log("response=", response.toString());
    return response;
  }
}
