import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../data/api/api.dart';
import '../../../../data/end_points.dart';
import '../../../../domain/entities/entities.dart';
import '../../../components/compnents.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileController with _$ProfileController;

abstract class _ProfileController with Store {
  @observable
  Pet pet = Pet();

  @action
  Future<bool> getProfileFromApi(
    BuildContext context, {
    required PetType petType,
    required String id,
  }) async {
    try {
      var response = await ApiManager().get(petType: petType, endPoint: EndPoint.imageID(id));
      if (response.statusCode == 200) {
        pet = Pet.fromJson(json.decode(response.body), petType: petType);

        return true;
      } else {
        if (response.body.contains('message')) {
          GlobalWidgets.msgAlert(context: context, title: apiErrorFromJson(response.body).message);

          return false;
        } else {
          unknownError(context);

          return false;
        }
      }
    } catch (e) {
      if (kDebugMode) print("ERROR: getProfileFromApi: " + e.toString());
      unknownError(context);
      return false;
    }
  }
}
