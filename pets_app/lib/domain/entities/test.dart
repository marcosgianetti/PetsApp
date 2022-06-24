// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);
/*
import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        this.breeds,
        this.categories,
        this.id,
        this.url,
        this.width,
        this.height,
    });

    List<Breed> breeds;
    List<Category> categories;
    String id;
    String url;
    int width;
    int height;

    factory User.fromJson(Map<String, dynamic> json) => User(
        breeds: List<Breed>.from(json["breeds"].map((x) => Breed.fromJson(x))),
        categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        id: json["id"],
        url: json["url"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
    );

    Map<String, dynamic> toJson() => {
        "breeds": List<dynamic>.from(breeds.map((x) => x.toJson())),
        "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toJson())),
        "id": id,
        "url": url,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
    };
}

class Breed {
    Breed({
        this.weight,
        this.id,
        this.name,
        this.cfaUrl,
        this.vetstreetUrl,
        this.vcahospitalsUrl,
        this.temperament,
        this.origin,
        this.countryCodes,
        this.countryCode,
        this.description,
        this.lifeSpan,
        this.indoor,
        this.lap,
        this.altNames,
        this.adaptability,
        this.affectionLevel,
        this.childFriendly,
        this.dogFriendly,
        this.energyLevel,
        this.grooming,
        this.healthIssues,
        this.intelligence,
        this.sheddingLevel,
        this.socialNeeds,
        this.strangerFriendly,
        this.vocalisation,
        this.experimental,
        this.hairless,
        this.natural,
        this.rare,
        this.rex,
        this.suppressedTail,
        this.shortLegs,
        this.wikipediaUrl,
        this.hypoallergenic,
        this.referenceImageId,
    });

    Weight? weight;
    String? id;
    String? name;
    String? cfaUrl;
    String? vetstreetUrl;
    String? vcahospitalsUrl;
    String? temperament;
    String? origin;
    String? countryCodes;
    String? countryCode;
    String? description;
    String? lifeSpan;
    int? indoor;
    int? lap;
    String? altNames;
    int? adaptability;
    int? affectionLevel;
    int? childFriendly;
    int? dogFriendly;
    int? energyLevel;
    int? grooming;
    int? healthIssues;
    int? intelligence;
    int? sheddingLevel;
    int? socialNeeds;
    int? strangerFriendly;
    int? vocalisation;
    int? experimental;
    int? hairless;
    int? natural;
    int? rare;
    int? rex;
    int? suppressedTail;
    int? shortLegs;
    String? wikipediaUrl;
    int? hypoallergenic;
    String? referenceImageId;


}

class Weight {
    Weight({
        this.imperial,
        this.metric,
    });

    String imperial;
    String metric;

    factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        imperial: json["imperial"],
        metric: json["metric"],
    );

    Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
    };
}

class Category {
    Category({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
*/