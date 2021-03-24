import 'package:r_a_m/models/characters.dart';
import 'package:r_a_m/services/characters_api_provider.dart';

class CharactersRepository {
  CharactersProvider _charactersProvider = CharactersProvider();
  Future<Characters> getAllCharacters() => _charactersProvider.getCharacters();
}
