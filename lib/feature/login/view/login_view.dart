import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../product/companents/text/app_text_strings.dart';
import '../../../product/widget/custom_text_form_field.dart';
import '../../core/base/base_view.dart';
import '../model/user_req_model.dart';
import '../viewModel/login_view_model.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  double _borderRadius = 6;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, LoginViewModel viewModel) => Scaffold(
              body: SingleChildScrollView(
                physics: viewModel.codeNode.hasFocus || viewModel.emailNode.hasFocus || viewModel.passwordNode.hasFocus
                    ? const ScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  height: context.dynamicHeight(1),
                  child: Column(
                    children: [
                      const Spacer(),
                      Expanded(
                          flex: 1,
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                AppString().signInText,
                                style: context.textTheme.headline4,
                              ))),
                      Expanded(
                          flex: 7,
                          child: Card(
                            elevation: 5,
                            child: _textFields(viewModel),
                          )),
                      Expanded(
                        flex: 1,
                        child: _subInfo(context, viewModel),
                      ),
                      SizedBox(
                        height: context.dynamicHeight(0.09),
                        width: context.dynamicWidth(0.9),
                        child: _loginButton(context, viewModel),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ));
  }

  Form _textFields(LoginViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            codeController: viewModel.codeController,
            labelText: AppString().specialCodeText,
            textInputType: TextInputType.number,
            focusNode: viewModel.codeNode,
          ),
          CustomTextFormField(
            focusNode: viewModel.emailNode,
            codeController: viewModel.mailController,
            labelText: AppString().emailText,
            textInputType: TextInputType.emailAddress,
          ),
          CustomTextFormField(
            focusNode: viewModel.passwordNode,
            codeController: viewModel.passwordController,
            labelText: AppString().passwordText,
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }

  Row _subInfo(BuildContext context, LoginViewModel viewModel) {
    return Row(
      children: [
        Observer(builder: (_) {
          return Checkbox(
              value: viewModel.isCheckBox,
              activeColor: context.appTheme.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
              onChanged: (bool? value) {
                viewModel.isCheckBox = value ?? false;
              });
        }),
        Text(AppString().loggedInText),
        const Spacer(),
        Padding(
          padding: context.horizontalPaddingMedium,
          child: Text(AppString().forgotPasswordText),
        ),
      ],
    );
  }

  ElevatedButton _loginButton(BuildContext context, LoginViewModel viewModel) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: viewModel.formKey.currentState != null && viewModel.formKey.currentState!.validate()
              ? context.appTheme.primaryColor
              : context.appTheme.backgroundColor,
          /*  _codeController.text.isNotNullOrNoEmpty &&
                                _mailController.text.isNotNullOrNoEmpty &&
                                _passwordController.text.isNotNullOrNoEmpty
                            ? context.appTheme.primaryColor
                            : context.appTheme.backgroundColor, */
          side: BorderSide(
            color: context.appTheme.primaryColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: context.normalBorderRadius,
            side: BorderSide(
              color: context.appTheme.primaryColor,
            ),
          ),
        ),
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppString().talepAlindi)));
          // await Future.delayed(Duration(seconds: 2));
          // context.navigateToPage(SignUp());
          viewModel.login(
              UserRequestModel(email: viewModel.mailController.text, password: viewModel.passwordController.text));
        },
        child: Text(
          AppString().signInText,
          style: context.textTheme.headline6,
        ));
  }
}
