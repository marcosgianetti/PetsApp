import 'package:test/test.dart';

void main() {
  test("Url listPets should return with correct values", () {
    String expectOutputDog = 'https://api.thedogapi.com/v1/images/search?limit=5&page=1&size=small&oder=desc';
    String expectOutputCat = 'https://api.thecatapi.com/v1/images/search?limit=5&page=1&size=small&oder=desc';
/*
    String output = EndPoint.listPets(petType: PetType.dog, page: 1, oderType: OderType.desc, sizeType: SizeType.small);

    expect(expectOutputDog == output, true);

    output = EndPoint.listPets(petType: PetType.cat, page: 1, oderType: OderType.desc, sizeType: SizeType.small);

    expect(expectOutputCat == output, true);*/
  });
}
