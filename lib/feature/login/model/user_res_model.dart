import 'package:vexana/vexana.dart';

class UserResponseModel extends INetworkModel {
  UserResponseModel({
    this.token,
  });

  String? token;

  Map<String, dynamic> toJson() => {
        "token": token,
      };

  @override
  fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      token: json["token"],
    );
  }
}
