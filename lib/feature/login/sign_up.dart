import 'package:flutter/material.dart';
import 'package:vbt_camp_widget/product/widget/custom_text_form_field.dart';

import '../../product/companents/text/app_text_strings.dart';
import 'package:kartal/kartal.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final TextEditingController _codeController = TextEditingController();
  final FocusNode _codeNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordNode = FocusNode();
  bool _isCheckBox = false;
  double _textFontSize = 16;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: context.paddingNormal,
        child: SingleChildScrollView(
          physics: _codeNode.hasFocus || _emailNode.hasFocus || _passwordNode.hasFocus || _nameNode.hasFocus
              ? const ScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              _pageHeader(context),
              SizedBox(
                height: context.dynamicHeight(0.03),
              ),
              _formField(),
              _signUpSubInfo(context),
              Padding(
                padding: context.verticalPaddingMedium,
                child: _signUp(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align _pageHeader(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppString().signUp,
        style: context.textTheme.headline4?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Form _formField() {
    return Form(
      key: _formKey,
      child: Card(
        child: Column(
          children: [
            CustomTextFormField(
              codeController: _nameController,
              labelText: AppString().specialCodeText,
              textInputType: TextInputType.number,
              focusNode: _nameNode,
            ),
            CustomTextFormField(
              codeController: _emailController,
              labelText: AppString().specialCodeText,
              textInputType: TextInputType.number,
              focusNode: _emailNode,
            ),
            CustomTextFormField(
              codeController: _codeController,
              labelText: AppString().specialCodeText,
              textInputType: TextInputType.number,
              focusNode: _codeNode,
            ),
            CustomTextFormField(
              codeController: _passwordController,
              labelText: AppString().specialCodeText,
              textInputType: TextInputType.number,
              focusNode: _passwordNode,
            ),
          ],
        ),
      ),
    );
  }

  Row _signUpSubInfo(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: _isCheckBox,
            onChanged: (bool? value) {
              setState(() {
                _isCheckBox = value ?? false;
              });
            }),
        Padding(
          padding: context.horizontalPaddingLow,
          child: Text(
            AppString().mountlySignUp,
            style: TextStyle(fontSize: _textFontSize),
          ),
        )
      ],
    );
  }

  SizedBox _signUp(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.9),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary:
              /*  _formKey.currentState != null && _formKey.currentState!.validate()
                        ? context.appTheme.primaryColor
                        : context.appTheme.backgroundColor, */
              _codeController.text.isNotNullOrNoEmpty &&
                      _nameController.text.isNotNullOrNoEmpty &&
                      _emailController.text.isNotNullOrNoEmpty &&
                      _passwordController.text.isNotNullOrNoEmpty
                  ? context.appTheme.primaryColor
                  : context.appTheme.backgroundColor,
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
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppString().talepAlindi)));
          }
        },
        child: Text(
          AppString().signUp,
          style: context.textTheme.headline6,
        ),
      ),
    );
  }
}
