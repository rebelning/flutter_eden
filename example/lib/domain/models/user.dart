

class User{
  String? userId;
  String? username;
  String? accessToken;
  String? mobile;
  String? address;

  User({this.userId, this.username,this.accessToken,this.mobile,this.address});

  @override
  String toString() {
    return 'User{userId: $userId, username: $username, accessToken: $accessToken, mobile: $mobile, address: $address}';
  }
}
