import 'package:example/domain/models/menu.dart';

class MenuMapper {
  static List<Menu> fromJsonList(List<dynamic> json) =>
      json.map((i) => fromJson(i)).toList();

  static Menu fromJson(Map<String, dynamic> json) {
    return Menu(
      menuId: json["menuId"] as String,
      section: json["section"] as String,
      action: json["action"] as String,
    );
  }
}
