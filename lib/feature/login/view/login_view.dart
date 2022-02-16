import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_camp_widget/product/companents/text/app_text_strings.dart';
import 'package:vbt_camp_widget/product/widget/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isCheckBox = false;
  final FocusNode _codeNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isValidate = false;
  double _borderRadius = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: _codeNode.hasFocus || _emailNode.hasFocus || _passwordNode.hasFocus
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
                        AppString().signInText ?? '',
                        style: context.textTheme.headline4,
                      ))),
              Expanded(
                flex: 7,
                child: Card(
                  elevation: 5,
                  child: _TextFields(),
                ),
              ),
              Expanded(
                flex: 1,
                child: _subInfo(context),
              ),
              SizedBox(
                height: context.dynamicHeight(0.09),
                width: context.dynamicWidth(0.9),
                child: _LoginButton(context),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Form _TextFields() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            codeController: _codeController,
            labelText: AppString().specialCodeText ?? '',
            textInputType: TextInputType.number,
            focusNode: _codeNode,
          ),
          CustomTextFormField(
            focusNode: _emailNode,
            codeController: _mailController,
            labelText: AppString().emailText ?? '',
            textInputType: TextInputType.emailAddress,
          ),
          CustomTextFormField(
            focusNode: _passwordNode,
            codeController: _passwordController,
            labelText: AppString().passwordText ?? '',
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }

  Row _subInfo(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: isCheckBox,
            activeColor: context.appTheme.primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
            onChanged: (bool? value) {
              setState(() {
                isCheckBox = value ?? false;
              });
            }),
        Text(AppString().loggedInText ?? ''),
        const Spacer(),
        Padding(
          padding: context.horizontalPaddingMedium,
          child: Text(AppString().forgotPasswordText ?? ''),
        ),
      ],
    );
  }

  ElevatedButton _LoginButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: _formKey.currentState != null && _formKey.currentState!.validate()
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
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppString().talepAlindi ?? '')));
          }
        },
        child: Text(
          AppString().signInText ?? '',
          style: context.textTheme.headline6,
        ));
  }
}
