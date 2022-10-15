import 'dart:convert';

import 'package:example/domain/entity/user_model.dart';

///
class LoginModel {
  int? resCode;
  String? message;
  UserInfo? data;
  LoginModel({
    this.resCode,
    this.message,
    this.data,
  });
  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        resCode: json["resCode"],
        message: json["message"],
        data: UserInfo.fromJson(json["data"] ?? {}),
      );
  Map<String, dynamic> toJson() => {
        "resCode": resCode,
        "message": message,
        "data": data?.toJson(),
      };
}
