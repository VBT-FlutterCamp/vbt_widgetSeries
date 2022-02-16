import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController codeController;
  final TextInputType textInputType;
  final String labelText;
  final bool isPassword;
  final FocusNode focusNode;
  const CustomTextFormField(
      {Key? key,
      required this.codeController,
      required this.textInputType,
      required this.labelText,
      this.isPassword = false,
      required this.focusNode})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Bu alan boş kalmamalı";
          }
          if (value.length < 6) {
            return "6 dan küçük olamaz";
          }
          if (value.length > 20) {
            return "20 den büyük olamaz";
          }
        },
        focusNode: widget.focusNode,
        controller: widget.codeController,
        keyboardType: widget.textInputType,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: context.textTheme.headline5,
          enabledBorder: OutlineInputBorder(
              borderRadius: context.normalBorderRadius, borderSide: BorderSide(color: context.appTheme.primaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: context.normalBorderRadius, borderSide: BorderSide(color: context.appTheme.primaryColor)),
        ),
      ),
    );
  }
}
