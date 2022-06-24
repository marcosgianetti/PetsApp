import 'tools/enum_values.dart';

enum PetType { dog, cat, none }

final petTypeMap = EnumValues({
  "Gato": PetType.cat,
  "Cão": PetType.dog,
});
