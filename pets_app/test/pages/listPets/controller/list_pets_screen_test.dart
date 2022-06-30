import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pets_app/domain/entities/entities.dart';
import 'package:pets_app/ui/pages/listPets/controller/list_pets_controller.dart';

class MockPet extends Mock implements Pet {}

void main() {
  ListPetController listPetController = ListPetController();

  test("Should have all perts selected", () {
    expect(listPetController.petsSelected.length, 2);
  });

  test("Should remove and add petType", () {
    expect(listPetController.petsSelected.length, 2);

    listPetController.changePetSelected(petType: PetType.cat);

    expect(listPetController.petsSelected.length, 1);

    //Não deve remover
    listPetController.changePetSelected(petType: PetType.dog);

    expect(listPetController.petsSelected.length, 1);

    listPetController.changePetSelected(petType: PetType.cat);

    expect(listPetController.petsSelected.length, 2);
  });

  test("Show add new pet in list of pets", () {
    expect(listPetController.listPet.isEmpty, true);

    listPetController.addResults([MockPet()]);

    expect(listPetController.listPet.length, 1);
  });
  test("Should change loading state", () {
    listPetController.changeLoading(true);
    expect(listPetController.loading, true);

    listPetController.changeLoading(false);
    expect(listPetController.loading, false);
  });
}
