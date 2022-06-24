import 'dart:convert';

import 'entities.dart';
import 'tools/enum_values.dart';

List<Pet> petsFromJson(String str, {required PetType petType}) => List<Pet>.from(
      json.decode(str).map(
            (x) => Pet.fromJson(x, petType: petType),
          ),
    );

class Pet {
  Pet({
    this.breeds = const <Breed>[],
    this.categories = const <Category>[],
    this.id,
    this.url,
    this.width,
    this.height,
    this.petType = PetType.none,
  });

  List<Breed> breeds;
  List<Category> categories;
  String? id;
  String? url;
  int? width;
  int? height;
  PetType petType;

  factory Pet.fromJson(Map<String, dynamic> json, {required PetType petType}) => Pet(
        breeds: json["breeds"] == null ? <Breed>[] : List<Breed>.from(json["breeds"].map((x) => Breed.fromJson(x))),
        categories: json["categories"] == null
            ? <Category>[]
            : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
        petType: petType,
      );
}

class Breed {
  Breed({
    this.weight,
    this.height,
    this.id,
    this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.referenceImageId,
    this.history,
    this.countryCode,
    this.origin,
    this.description,
  });

  Eight? weight;
  Eight? height;
  dynamic id;
  String? name;
  String? bredFor;
  BreedGroup? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? referenceImageId;
  String? history;
  String? countryCode;
  String? origin;
  String? description;

  factory Breed.fromJson(Map<String, dynamic> json) => Breed(
        weight: Eight.fromJson(json["weight"] ?? {}),
        height: Eight.fromJson(json["height"] ?? {}),
        id: json["id"],
        name: json["name"],
        bredFor: json["bred_for"],
        breedGroup: json["breed_group"] == null ? null : breedGroupValues.map[json["breed_group"]],
        lifeSpan: json["life_span"],
        temperament: json["temperament"],
        referenceImageId: json["reference_image_id"],
        history: json["history"],
        countryCode: json["country_code"],
        origin: json["origin"],
        description: json["description"],
      );
}

class Category {
  Category({this.id, this.name});

  int? id;
  String? name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );
}

enum BreedGroup { WORKING, HOUND, TERRIER, NON_SPORTING, HERDING, SPORTING, EMPTY, MIXED }

final breedGroupValues = EnumValues({
  "": BreedGroup.EMPTY,
  "Herding": BreedGroup.HERDING,
  "Hound": BreedGroup.HOUND,
  "Mixed": BreedGroup.MIXED,
  "Non-Sporting": BreedGroup.NON_SPORTING,
  "Sporting": BreedGroup.SPORTING,
  "Terrier": BreedGroup.TERRIER,
  "Working": BreedGroup.WORKING
});

class Eight {
  Eight({
    this.imperial,
    this.metric,
  });

  String? imperial;
  String? metric;

  factory Eight.fromJson(Map<String, dynamic> json) => Eight(
        imperial: json["imperial"],
        metric: json["metric"],
      );
  @override
  String toString() {
    String output = "";
    if (imperial != null) {
      output = "Medida imperial: $imperial";
    }
    if (metric != null) {
      if (output.isNotEmpty) {
        output += "\n";
      }
      output += "Medida métrica: $metric";
    }
    return output;
  }
}
