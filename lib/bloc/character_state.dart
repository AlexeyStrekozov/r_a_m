import 'package:flutter/material.dart';
import 'package:r_a_m/models/character.dart';

abstract class CharacterState {}

class CharacterEmptyState extends CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterLoadedState extends CharacterState {
  List<Character> loadedCharacter;
  CharacterLoadedState({@required this.loadedCharacter})
      : assert(loadedCharacter != null);
}

class CharacterErrorState extends CharacterState {}
