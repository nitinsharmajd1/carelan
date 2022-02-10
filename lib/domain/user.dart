class User {
  int userId;
  String mobile;
  String type;
  String token;
  String renewalToken;

  User({required this.userId, required this.mobile, required this.type, required this.token, required this.renewalToken, name});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        userId: responseData['id'],
        mobile: responseData['phone'],
        type: responseData['type'],
        token: responseData['access_token'],
        renewalToken: responseData['renewal_token'],
    );
  }
}