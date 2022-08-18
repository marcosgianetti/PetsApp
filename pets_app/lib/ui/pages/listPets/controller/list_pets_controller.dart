import 'package:http/http.dart';

import 'package:mobx/mobx.dart';

import '../../../../data/api/api.dart';
import '../../../../data/end_points.dart';
import '../../../../domain/entities/entities.dart';

part 'list_pets_controller.g.dart';

class ListPetController = ListPetControllerBase with _$ListPetController;

abstract class ListPetControllerBase with Store {
  @observable
  List<Pet> listPet = <Pet>[];
  @observable
  bool loading = false;
  int page = 0;
  @observable
  List<PetType> petsSelected = <PetType>[PetType.cat, PetType.dog];

  ///✅
  @action
  String changePetSelected({required PetType petType}) {
    // Há somente um pet na lista e ele foi selecionado?
    if (petsSelected.contains(petType) && petsSelected.length == 1) {
      return "Você deve selecionar ao menos um tipo de pet";
    } else {
      // Se o pet já está na lista, remover, se não, adiciona
      if (petsSelected.contains(petType)) {
        petsSelected.removeWhere((element) => element == petType);
      } else {
        petsSelected.add(petType);
      }
      petsSelected = petsSelected;
    }
    listPet.clear();
    return "";
  }

  ///❌
  Future<bool> showPetsSelected({ApiManagerClient? apiManagerClient}) async {
    try {
      await Future.forEach<PetType>(petsSelected, (item) async {
        await getPetFromApi(petType: item, apiManagerClient: apiManagerClient);
      });
      page++;
      return true;
    } catch (error) {
      return false;
    }
  }

  ///✅
  @action
  Future<bool> getPetFromApi({PetType petType = PetType.dog, ApiManagerClient? apiManagerClient}) async {
    changeLoading(true);
    apiManagerClient = apiManagerClient ?? ApiManager();

    Response response = await apiManagerClient.get(petType: petType, endPoint: EndPoint.listPets(page: page));

    if (response.statusCode == 200) {
      if (response.body != "") {
        if (listPet.isEmpty) {
          listPet = petsFromJson(response.body, petType: petType);
        } else {
          addResults(petsFromJson(response.body, petType: petType));
        }
      }
      changeLoading(false);
      return true;
    } else {
      if (response.body.contains('message')) {
        // GlobalWidgets.msgAlert(context: context, title: apiErrorFromJson(response.body).message);
        changeLoading(false);

        return false;
      } else {
        // unknownError();
        changeLoading(false);

        return false;
      }
    }
  }

  ///✅
  @action
  void addResults(List<Pet> newPets) {
    for (var newPet in newPets) {
      listPet.add(newPet);
    }
    listPet = listPet;
  }

  ///✅
  @action
  changeLoading(bool value) {
    loading = value;
  }
}
