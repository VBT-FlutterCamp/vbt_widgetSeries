import 'package:vbt_camp_widget/feature/login/model/user_req_model.dart';

import '../../../feature/login/model/user_res_model.dart';

abstract class IUserManager {
  void saveUser(UserResponseModel responseModel);
  void clearData();
}

class UserManager extends IUserManager {
  UserResponseModel? userResponseModel;
  bool isLogin = false;
  @override
  void clearData() {
    _changeLoginValue(false);
  }

  void _changeLoginValue(bool value) {
    isLogin = value;
  }

  @override
  void saveUser(UserResponseModel responseModel) {
    userResponseModel = responseModel;
    _changeLoginValue(true);
  }
}
