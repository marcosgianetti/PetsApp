import '../domain/entities/tools/enum_values.dart';

class EndPoint {
  static String listPets({
    int limit = 10,
    int? page,
    OderType? oderType,
    SizeType? sizeType,
  }) {
    String output = "images/search?limit=$limit";

    if (page != null) {
      output += "&page=$page";
    }
    if (sizeType != null) {
      output += "&size=${_sizeTypeValues.reverse[sizeType]}";
    }
    if (oderType != null) {
      output += "&oder=${_oderTypeValues.reverse[oderType]}";
    }

    return output;
  }

  static String imageID(String imageID) => "images/$imageID";

  static String listUsers = "https://raw.githubusercontent.com/marcosgianetti/PetsApp/main/emailsList/users.txt.txt";
}

enum OderType { random, asc, desc }

final _oderTypeValues = EnumValues({
  "random": OderType.random,
  "asc": OderType.asc,
  "desc": OderType.desc,
});

enum SizeType { thumb, small, med, full }

final _sizeTypeValues = EnumValues({
  "tumb": SizeType.thumb,
  "small": SizeType.small,
  "med": SizeType.med,
  "full": SizeType.full,
});
