import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_a_m/bloc/character_event.dart';
import 'package:r_a_m/bloc/character_state.dart';
import 'package:r_a_m/models/character.dart';
import 'package:r_a_m/models/characters.dart';
import 'package:r_a_m/services/characters_repository.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharactersRepository charactersRepository;
  CharacterBloc({this.charactersRepository})
      : assert(charactersRepository != null),
        super(CharacterEmptyState());

  @override
  Stream<CharacterState> mapEventToState(CharacterEvent event) async* {
    if (event is CharacterLoadEvent) {
      yield CharacterLoadingState();
      try {
        final Characters _loadedCharacter =
            await charactersRepository.getAllCharacters();
        final characterMoadl =
            _loadedCharacter.results.map((e) => Character(e)).toList();

        yield CharacterLoadedState(loadedCharacter: characterMoadl);
      } catch (_) {
        yield CharacterEmptyState();
      }
    }
  }
}
