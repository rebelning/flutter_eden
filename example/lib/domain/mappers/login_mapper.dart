
import 'package:example/domain/models/user.dart';

class LoginMapper{
  static List<User> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int,
      name: json["name"] as String
    );
  }
}