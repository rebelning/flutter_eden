import 'package:example/domain/models/user.dart';

class LoginMapper {
  static List<User> fromJsonList(List<dynamic> json) =>
      json.map((i) => fromJson(i)).toList();

  static User fromJson(Map<String, dynamic> json) {
    return User(
        userId: json["userId"] as String,
        username: json["username"] as String,
        accessToken: json["accessToken"] as String,
        mobile: json["mobile"] as String,
        address: json["address"] as String);
  }
}
