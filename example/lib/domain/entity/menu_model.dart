import 'dart:convert';

class MenuModel {
  int? resCode;
  String? message;
  List<MenuInfo>? data;
  MenuModel({
    this.resCode,
    this.message,
    this.data,
  });

  factory MenuModel.fromRawJson(String str) =>
      MenuModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  ///
  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        resCode: json["resCode"],
        message: json["message"],
        data: MenuInfo.fromJsonList(json["data"] ?? []),
      );

  Map<String, dynamic> toJson() => {
        "resCode": resCode,
        "message": message,
        "data": data,
      };
}

class MenuInfo {
  String? menuId;
  String? section;
  String? action;
  MenuInfo({
    this.menuId,
    this.section,
    this.action,
  });

  static List<MenuInfo> fromJsonList(List<dynamic> json) =>
      json.map((i) => MenuInfo.fromJson(i)).toList();

  factory MenuInfo.fromRawJson(String str) =>
      MenuInfo.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  ///
  factory MenuInfo.fromJson(Map<String, dynamic> json) => MenuInfo(
        menuId: json["menuId"],
        section: json["section"],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "menuId": menuId,
        "section": section,
        "action": action,
      };
}
