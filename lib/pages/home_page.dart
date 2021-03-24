import 'package:flutter/material.dart';
import 'package:r_a_m/bloc/character_bloc.dart';
import 'package:r_a_m/bloc/character_event.dart';
import 'package:r_a_m/services/characters_repository.dart';
import 'package:r_a_m/widgets/characters_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final charactersRepository = CharactersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterBloc>(
      create: (context) =>
          CharacterBloc(charactersRepository: charactersRepository)
            ..add(CharacterLoadEvent()),
      child: Scaffold(
        backgroundColor: Color(0xFF24282F),
        appBar: AppBar(
          title: Text("Rick and Morty"),
          centerTitle: true,
          backgroundColor: Color(0xFF3C3E44),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CharactersList(),
            )
          ],
        ),
      ),
    );
  }
}
