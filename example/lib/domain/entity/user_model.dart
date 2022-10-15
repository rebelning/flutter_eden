import 'dart:convert';

class UserInfo {
  String? userId;
  String? username;
  String? mobile;
  String? address;
  String? accessToken;
  UserInfo({
    this.userId,
    this.username,
    this.mobile,
    this.address,
    this.accessToken,
  });

  factory UserInfo.fromRawJson(String str) =>
      UserInfo.fromJson(json.decode(str) as Map<String, dynamic>);

  String? toRawJson() => json.encode(toJson());

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        userId: json["userId"],
        username: json["username"],
        mobile: json["mobile"],
        address: json["address"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "mobile": mobile,
        "address": address,
        "accessToken": accessToken,
      };
}
