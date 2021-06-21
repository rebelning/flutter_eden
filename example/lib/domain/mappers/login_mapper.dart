import 'package:example/domain/models/user.dart';

class LoginMapper {
  static List<User> fromJsonList(List<dynamic> json) =>
      json.map((i) => fromJson(i)).toList();

  static User fromJson(Map<String, dynamic> json) {
    return User(
        userId: json["userId"],
        username: json["username"],
        accessToken: json["accessToken"],
        mobile: json["mobile"],
        address: json["address"]);
  }
}
