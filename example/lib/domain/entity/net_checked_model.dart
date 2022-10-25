import 'dart:convert';

class NetCheckedModel {
  int? resCode;
  String? message;
  NetCheckedModel({
    this.resCode,
    this.message,
  });

  factory NetCheckedModel.fromRawJson(String str) =>
      NetCheckedModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String? toRawJson() => json.encode(toJson());

  factory NetCheckedModel.fromJson(Map<String, dynamic> json) =>
      NetCheckedModel(
        resCode: json["userId"],
        message: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "resCode": resCode,
        "message": message,
      };
}
