import 'package:r_a_m/models/characters.dart';

class Character {
  String name;
  String img;
  String status;
  String species;
  String location;
  String gender;
  String origin;

  Character(Result result) {
    name = result?.name ?? "";
    img = result?.image ?? "";
    status = result?.status ?? "";
    species = result?.species ?? "";
    location = result?.location?.name ?? "";
    gender = result?.gender ?? "";
    origin = result?.origin?.name ?? "";
  }
}
