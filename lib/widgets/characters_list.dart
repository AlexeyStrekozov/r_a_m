import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_a_m/bloc/character_bloc.dart';
import 'package:r_a_m/bloc/character_state.dart';
import 'package:r_a_m/pages/detail_page.dart';

class CharactersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is CharacterEmptyState) {
          return Center(
            child: Text("No data"),
          );
        }

        if (state is CharacterLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is CharacterLoadedState) {
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetaliPage(
                              img: state.loadedCharacter[index].img,
                              name: state.loadedCharacter[index].name,
                              status: state.loadedCharacter[index].status,
                              species: state.loadedCharacter[index].species,
                              origin: state.loadedCharacter[index].origin,
                              gender: state.loadedCharacter[index].gender,
                              location: state.loadedCharacter[index].location,
                            )));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 9, left: 25, right: 25),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFF3C3E44),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(state.loadedCharacter[index].img),
                    radius: 35.0,
                  ),
                  title: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 13),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  state.loadedCharacter[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ])),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(children: [
                            Container(
                              width: 10,
                              height: 10,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  color: state.loadedCharacter[index].status ==
                                          'Alive'
                                      ? Colors.green
                                      : Colors.red),
                            ),
                            Text(
                              '${state.loadedCharacter[index].status} - ${state.loadedCharacter[index].species}',
                              style: TextStyle(
                                color: Color(0xFF6C6E72),
                                fontSize: 13,
                              ),
                            ),
                          ]),
                          Text(
                            state.loadedCharacter[index].gender,
                            style: TextStyle(
                              color: Color(0xFF6C6E72),
                              fontSize: 13,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        if (state is CharacterErrorState) {
          return Center(
            child: Text("Error"),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
