import 'dart:convert';

import 'package:example/domain/http_response.dart';
import 'package:example/domain/mappers/menu_mapper.dart';

import 'package:flutter_eden/eden.dart';

class AccountService {
  HttpClient client = inject<HttpClient>();

  Future<HttpResponse> getMenuList() async {
    HttpResponse response = HttpResponse();
    response.resCode = 200;
    List<Map<String, dynamic>> tmpList = [
      {"id": 1, "section": "setting"},
      {"id": 2, "section": "setting"},
      {"id": 3, "section": "setting"},
      {"id": 4, "section": "setting"},
      {"id": 4, "section": "setting"},
      {"id": 4, "section": "setting"},
      {"id": 4, "section": "setting"},
      {"id": 4, "section": "setting"},
      {"id": 4, "section": "setting"},
      {"id": 4, "section": "setting"},
      {"id": 4, "section": "setting"},
      {"id": 4, "section": "setting"},
      {"id": 4, "section": "setting"},
      {"id": 4, "section": "setting"},
      {"id": 4, "section": "setting"},
      {"id": 4, "section": "setting"},
      {"id": 4, "section": "setting"},
    ];
    response.data = MenuMapper.fromJsonList(tmpList);

    return response;
  }
}
