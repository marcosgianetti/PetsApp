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

  late final _$getProfileFromApiAsyncAction =
      AsyncAction('_LoginController.getProfileFromApi', context: context);

  @override
  Future<void> getProfileFromApi(BuildContext context) {
    return _$getProfileFromApiAsyncAction
        .run(() => super.getProfileFromApi(context));
  }

  @override
  String toString() {
    return '''
errorText: ${errorText},
users: ${users}
    ''';
  }
}
