import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:vbt_camp_widget/feature/login/model/user_res_model.dart';

import '../../../core/base/base_view_model.dart';
import '../model/user_req_model.dart';
import '../service/user_service.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  late IUserService loginService;
  final TextEditingController codeController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode codeNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  @observable
  bool isCheckBox = false;

  @observable
  bool isValidate = false;
  @observable
  UserResponseModel? userResponseModel;

  @action
  Future<void> login(UserRequestModel model) async {
    userResponseModel = await loginService.login(model);
  }

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    loginService = UserService(networkmanager);
  }
}
