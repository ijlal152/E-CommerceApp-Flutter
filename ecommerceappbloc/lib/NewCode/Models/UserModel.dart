class UserModel {
  String? user_id;
  String? user_email;
  String? user_password;

  UserModel({this.user_id, this.user_email, this.user_password});

  Map<String, dynamic> toMap() {
    return {
      "user_id": user_id,
      "user_email": user_email,
      "user_password": user_password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      user_id: map["user_id"],
      user_email: map["user_email"],
      user_password: map["user_password"],
    );
  }
//
}