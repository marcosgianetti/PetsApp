import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_app/data/provider/cacheLogin/cache_login.dart';
import 'package:pets_app/domain/entities/entities.dart';

import '../../../../data/api/api.dart';
import '../../../../data/end_points.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  String? errorText;
  @observable
  List<User> users = <User>[];
  @observable
  bool rememberMe = true;
  @observable
  bool loading = false;
  @observable
  TextEditingController textEmailLoginController = TextEditingController();

  @action
  void changeRememberMe({bool? value}) {
    rememberMe = value ?? !rememberMe;
  }

  Future checkCache(BuildContext context) async {
    User user = await CacheLogin.getLoginCache();
    if (user.email != null) {
      if (user.email != "") {
        textEmailLoginController.text = user.email!;
        changeLoadingState(true);
        getProfileFromApi(context);
      }
    }
  }

  @action
  void changeLoadingState(bool loading) {
    this.loading = loading;
  }

  @action
  Future<void> getProfileFromApi(BuildContext context) async {
    changeLoadingState(true);
    try {
      errorText = null;

      bool emailValid = verifyEmailValid(textEmailLoginController.text);
      if (!emailValid) {
        errorText = "E-mail invalido";
        changeLoadingState(false);
        return;
      }

      var response = await ReqAPI.get(endPoint: EndPoint.listUsers);
      await Future.delayed(const Duration(seconds: 1));

      changeLoadingState(false);
      if (response.statusCode == 200) {
        users = userFromJson(response.body);
        bool containsEmailAtList = false;
        for (var element in users) {
          if (element.email == textEmailLoginController.text) {
            containsEmailAtList = true;
            if (rememberMe) {
              CacheLogin.setLoginResponse(user: element);
            }
            break;
          }
        }
        if (containsEmailAtList) {
          Navigator.pushReplacementNamed(context, '/pets');
        } else {
          errorText = "E-mail n??o cadastrado";
        }
      } else {
        if (response.body.contains('message')) {
          errorText = apiErrorFromJson(response.body).message;
        } else {
          errorText = "Algo de inesperado aconteceu, tente mais tarde";
        }
      }
    } catch (e) {
      changeLoadingState(false);
      errorText = "Algo de inesperado aconteceu, tente mais tarde";
    }
  }

  bool verifyEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}
