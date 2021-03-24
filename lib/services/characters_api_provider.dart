import 'package:r_a_m/models/characters.dart';
import 'package:dio/dio.dart';

class CharactersProvider {
  static const _BASE_URL = 'https://rickandmortyapi.com/api/character/?page=1';

  Future<Characters> getCharacters() async {
    final response = await Dio().get(_BASE_URL);
    if (response.statusCode == 200) {
      return Characters.fromJson(response.data);
    } else {
      throw Exception("Error data");
    }
  }
}
