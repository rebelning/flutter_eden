import 'package:example/domain/mappers/menu_mapper.dart';
import 'package:example/domain/models/menu.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flutter_eden/eden.dart';
import 'package:example/domain/base/end_points.dart' as EndPoints;

class AccountService {
  HttpClient client = inject<HttpClient>();

  Future<HttpResponse<List<Menu>>> getMenuList() async {
    HttpResponse<List<Menu>> response = HttpResponse();
    String url = EndPoints.appList.menuList;
    final ret = client.get(url);
    ret.then((res) {
      response.resCode = res.statusCode;
      response.data = MenuMapper.fromJsonList(res.data["data"]);

    }).catchError((onError) {
      response.resCode = 500; //失败
      response.message = onError.toString();
    });

    DebugLog.log("response=", response.toString());
    return response;
  }
}
