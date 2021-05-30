import 'package:example/domain/http_response.dart';

class User extends HttpResponse{
  String userId;
  String username;

  User({this.userId, this.username});

  @override
  String toString() {
    return 'User{userId: $userId, username: $username}';
  }
}
