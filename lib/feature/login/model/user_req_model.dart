class UserRequestModel {
  UserRequestModel({
    this.email,
    this.password,
  });

  String? email;
  String? password;

  factory UserRequestModel.fromJson(Map<String, dynamic> json) => UserRequestModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
