// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  final _$isCheckBoxAtom = Atom(name: '_LoginViewModelBase.isCheckBox');

  @override
  bool get isCheckBox {
    _$isCheckBoxAtom.reportRead();
    return super.isCheckBox;
  }

  @override
  set isCheckBox(bool value) {
    _$isCheckBoxAtom.reportWrite(value, super.isCheckBox, () {
      super.isCheckBox = value;
    });
  }

  final _$isValidateAtom = Atom(name: '_LoginViewModelBase.isValidate');

  @override
  bool get isValidate {
    _$isValidateAtom.reportRead();
    return super.isValidate;
  }

  @override
  set isValidate(bool value) {
    _$isValidateAtom.reportWrite(value, super.isValidate, () {
      super.isValidate = value;
    });
  }

  final _$userResponseModelAtom =
      Atom(name: '_LoginViewModelBase.userResponseModel');

  @override
  UserResponseModel? get userResponseModel {
    _$userResponseModelAtom.reportRead();
    return super.userResponseModel;
  }

  @override
  set userResponseModel(UserResponseModel? value) {
    _$userResponseModelAtom.reportWrite(value, super.userResponseModel, () {
      super.userResponseModel = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginViewModelBase.login');

  @override
  Future<void> login(UserRequestModel model) {
    return _$loginAsyncAction.run(() => super.login(model));
  }

  @override
  String toString() {
    return '''
isCheckBox: ${isCheckBox},
isValidate: ${isValidate},
userResponseModel: ${userResponseModel}
    ''';
  }
}
