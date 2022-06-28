// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginController, Store {
  late final _$errorTextAtom =
      Atom(name: '_LoginController.errorText', context: context);

  @override
  String? get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String? value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$usersAtom =
      Atom(name: '_LoginController.users', context: context);

  @override
  List<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$rememberMeAtom =
      Atom(name: '_LoginController.rememberMe', context: context);

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportRead();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.reportWrite(value, super.rememberMe, () {
      super.rememberMe = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_LoginController.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$textEmailLoginControllerAtom =
      Atom(name: '_LoginController.textEmailLoginController', context: context);

  @override
  TextEditingController get textEmailLoginController {
    _$textEmailLoginControllerAtom.reportRead();
    return super.textEmailLoginController;
  }

  @override
  set textEmailLoginController(TextEditingController value) {
    _$textEmailLoginControllerAtom
        .reportWrite(value, super.textEmailLoginController, () {
      super.textEmailLoginController = value;
    });
  }

  late final _$getProfileFromApiAsyncAction =
      AsyncAction('_LoginController.getProfileFromApi', context: context);

  @override
  Future<void> getProfileFromApi(BuildContext context) {
    return _$getProfileFromApiAsyncAction
        .run(() => super.getProfileFromApi(context));
  }

  late final _$_LoginControllerActionController =
      ActionController(name: '_LoginController', context: context);

  @override
  void changeRememberMe({bool? value}) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.changeRememberMe');
    try {
      return super.changeRememberMe(value: value);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoadingState(bool loading) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.changeLoadingState');
    try {
      return super.changeLoadingState(loading);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorText: ${errorText},
users: ${users},
rememberMe: ${rememberMe},
loading: ${loading},
textEmailLoginController: ${textEmailLoginController}
    ''';
  }
}
