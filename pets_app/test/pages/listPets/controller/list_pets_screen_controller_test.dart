import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pets_app/data/api/api.dart';
import 'package:pets_app/data/end_points.dart';
import 'package:pets_app/domain/entities/entities.dart';
import 'package:pets_app/ui/pages/listPets/controller/list_pets_controller.dart';

import 'list_pets_screen_controller_test.mocks.dart';

class MockPet extends Mock implements Pet {}

@GenerateMocks([], customMocks: [MockSpec<ApiManagerClient>(returnNullOnMissingStub: true)])
void main() {
  ListPetController sut = ListPetController();
  MockApiManagerClient clientSpy = MockApiManagerClient();

  test("Should have all perts selected", () {
    expect(sut.petsSelected.length, 2);
  });

  test("Should remove and add petType", () {
    expect(sut.petsSelected.length, 2);

    sut.changePetSelected(petType: PetType.cat);

    expect(sut.petsSelected.length, 1);

    //Não deve remover
    sut.changePetSelected(petType: PetType.dog);

    expect(sut.petsSelected.length, 1);

    sut.changePetSelected(petType: PetType.cat);

    expect(sut.petsSelected.length, 2);
  });

  test("Show add new pet in list of pets", () {
    expect(sut.listPet.isEmpty, true);

    sut.addResults([MockPet()]);

    expect(sut.listPet.length, 1);
  });

  test("Should change loading state", () {
    sut.changeLoading(true);
    expect(sut.loading, true);

    sut.changeLoading(false);
    expect(sut.loading, false);
  });

  group("getPetFromApi: ", () {
    test("Should recive pet corretly from api", () async {
      ///
      /// ARRANGE
      ///
      int page = sut.page;
      PetType petType = PetType.dog;
      //Pet petResponse = Pet(breeds: [Breed(weight: Eight(metric: "2"))]);

      when(
        clientSpy.get(
          petType: petType,
          endPoint: EndPoint.listPets(page: page),
        ),
      ).thenAnswer((_) async => Response("", 200));

      ///
      /// ACT
      ///
      bool success = await sut.getPetFromApi(petType: PetType.dog, apiManagerClient: clientSpy);

      ///
      /// ASSERT
      ///
      expect(success, true);
    });
  });
  test("Should call apis selected", () async {
    ///
    /// ARRANGE
    ///
    sut.petsSelected = [PetType.cat, PetType.dog];
    int page = 0;
    sut.page = page;
    clientSpy = MockApiManagerClient();

    when(
      clientSpy.get(
        petType: PetType.cat,
        endPoint: EndPoint.listPets(page: page),
      ),
    ).thenAnswer((_) async => Response("", 200));

    when(
      clientSpy.get(
        petType: PetType.dog,
        endPoint: EndPoint.listPets(page: page),
      ),
    ).thenAnswer((_) async => Response("", 200));

    ///
    /// ACT
    ///
    bool success = await sut.showPetsSelected(apiManagerClient: clientSpy);

    ///
    /// ASSERT
    ///
    expect(success, true);

    verify(
      clientSpy.get(
        petType: PetType.dog,
        endPoint: EndPoint.listPets(page: page),
      ),
    ).called(1);

    verify(
      clientSpy.get(
        petType: PetType.cat,
        endPoint: EndPoint.listPets(page: page),
      ),
    ).called(1);
  });
}
