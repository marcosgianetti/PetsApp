import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_app/domain/entities/entities.dart';
import 'package:flutter/material.dart';

import '../../../../data/api/api.dart';
import '../../../../data/end_points.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  String? errorText;
  @observable
  List<User> users = <User>[];
  TextEditingController textEmailLoginController = TextEditingController();

  @action
  Future<void> getProfileFromApi(BuildContext context) async {
    try {
      var response = await ReqAPI.get(endPoint: EndPoint.listUsers);
      if (response.statusCode == 200) {
        users = userFromJson(response.body);
        bool containsEmailAtList = false;
        for (var element in users) {
          if (element.email == textEmailLoginController.text) {
            containsEmailAtList = true;
            break;
          }
        }
        if (containsEmailAtList) {
          Navigator.pushReplacementNamed(context, '/pets');
        } else {
          errorText = "E-mail não cadastrado";
        }
      } else {
        if (response.body.contains('message')) {
          errorText = apiErrorFromJson(response.body).message;
        } else {
          errorText = "Algo de inesperado aconteceu, tente mais tarde";
        }
      }
    } catch (e) {
      errorText = "Algo de inesperado aconteceu, tente mais tarde";
    }
  }
}
