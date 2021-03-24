import 'package:flutter/material.dart';
import 'package:r_a_m/services/characters_repository.dart';

class DetaliPage extends StatelessWidget {
  final charactersRepository = CharactersRepository();
  final String name;
  final String img;
  final String status;
  final String species;
  final String location;
  final String gender;
  final String origin;

  DetaliPage({
    Key key,
    @required this.name,
    @required this.img,
    @required this.status,
    @required this.species,
    @required this.location,
    @required this.gender,
    @required this.origin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF24282F),
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        backgroundColor: Color(0xFF3C3E44),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(130),
                border: Border.all(width: 1, color: Colors.white)),
            margin: EdgeInsets.only(
              top: 25,
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(img),
              radius: 130.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 33),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                    color: status == 'Alive' ? Colors.green : Colors.red),
              ),
              Text('${status}-${species}',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(bottom: 10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(color: Color(0xFF505359), width: 1.0),
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Origin location",
                          style:
                              TextStyle(color: Color(0xFF919397), fontSize: 13),
                        ),
                        Text(
                          '${origin}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(bottom: 10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(color: Color(0xFF505359), width: 1.0),
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style:
                              TextStyle(color: Color(0xFF919397), fontSize: 13),
                        ),
                        Text(
                          '${gender}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(bottom: 10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(color: Color(0xFF505359), width: 1.0),
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Origin location",
                          style:
                              TextStyle(color: Color(0xFF919397), fontSize: 13),
                        ),
                        Text(
                          '${location}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
