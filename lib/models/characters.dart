import 'package:meta/meta.dart';
import 'dart:convert';

Characters apiCharacterFromJson(String str) =>
    Characters.fromJson(json.decode(str));

String apiCharacterToJson(Characters data) => json.encode(data.toJson());

class Characters {
  Characters({
    @required this.info,
    @required this.results,
  });

  final Info info;
  final List<Result> results;

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info == null ? null : info.toJson(),
        "results": results == null
            ? null
            : List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Info {
  Info({
    @required this.count,
    @required this.pages,
    @required this.next,
    @required this.prev,
  });

  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"] == null ? null : json["count"],
        pages: json["pages"] == null ? null : json["pages"],
        next: json["next"] == null ? null : json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "pages": pages == null ? null : pages,
        "next": next == null ? null : next,
        "prev": prev,
      };
}

class Result {
  Result({
    @required this.id,
    @required this.name,
    @required this.status,
    @required this.species,
    @required this.type,
    @required this.gender,
    @required this.origin,
    @required this.location,
    @required this.image,
    @required this.episode,
    @required this.url,
    @required this.created,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        status: json["status"] == null ? null : json["status"],
        species: json["species"] == null ? null : json["species"],
        type: json["type"] == null ? null : json["type"],
        gender: json["gender"] == null ? null : json["gender"],
        origin:
            json["origin"] == null ? null : Location.fromJson(json["origin"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        image: json["image"] == null ? null : json["image"],
        episode: json["episode"] == null
            ? null
            : List<String>.from(json["episode"].map((x) => x)),
        url: json["url"] == null ? null : json["url"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "status": status == null ? null : statusValues.reverse[status],
        "species": species == null ? null : speciesValues.reverse[species],
        "type": type == null ? null : type,
        "gender": gender == null ? null : genderValues.reverse[gender],
        "origin": origin == null ? null : origin.toJson(),
        "location": location == null ? null : location.toJson(),
        "image": image == null ? null : image,
        "episode":
            episode == null ? null : List<dynamic>.from(episode.map((x) => x)),
        "url": url == null ? null : url,
        "created": created == null ? null : created.toIso8601String(),
      };
}

enum Gender { MALE, FEMALE, UNKNOWN }

final genderValues = EnumValues(
    {"Female": Gender.FEMALE, "Male": Gender.MALE, "unknown": Gender.UNKNOWN});

class Location {
  Location({
    @required this.name,
    @required this.url,
  });

  final String name;
  final String url;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}

enum Species { HUMAN, ALIEN }

final speciesValues =
    EnumValues({"Alien": Species.ALIEN, "Human": Species.HUMAN});

enum Status { ALIVE, UNKNOWN, DEAD }

final statusValues = EnumValues(
    {"Alive": Status.ALIVE, "Dead": Status.DEAD, "unknown": Status.UNKNOWN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
