import 'dart:io';

import 'package:rick_morty/bloc/character_bloc.dart';
import 'package:rick_morty/bloc/character_event.dart';
import 'package:rick_morty/bloc/character_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/models/character_model.dart';
import 'package:rick_morty/repository/repositories.dart';

class HomePage extends StatefulWidget {
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? createdAt;
  List<String> list = <String>['recent', '1 week', '1 month'];

  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) =>
                  CharacterBloc(CharactersRepository()))
        ],
        child: Scaffold(
          backgroundColor: Color.fromARGB(238, 255, 255, 255),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Characters',
                style: TextStyle(color: Colors.black, fontFamily: '')),
            elevation: 0,
            actions: [dropdownButton()],
          ),
          body: blocBody(),
        ));
  }

  Widget dropdownButton() {
    String dropdownValue = list.first;
    return DropdownButton<String>(
      elevation: 0,
      underline: Container(
        height: 0,
      ),
      value: dropdownValue,
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

Widget blocBody() {
  return BlocProvider(
    create: (context) => CharacterBloc(
      CharactersRepository(),
    )..add(LoadCharacterEvent()),
    child:
        BlocBuilder<CharacterBloc, CharacterState>(builder: (context, state) {
      if (state is CharacterLoadingState) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        );
      }
      if (state is CharacterLoadedState) {
        List<Character> characters = state.character;

        return SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 60),
            Center(
                child: Container(
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  itemCount: characters.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Container(
                          width: 355,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(237, 174, 234, 252),
                          ),
                          child: Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${characters[index].image}')),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10)),
                                  ),
                                  width: 100,
                                  height: 100),
                              SizedBox(width: 20),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Container(
                                        child: Text(
                                            "${characters[index].name == null ? 'no data' : '${characters[index].name}'} ",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontFamily: 'Stolzl',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500))),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                        "${characters[index].status == null ? 'no data' : '${characters[index].status}'} ",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontFamily: 'Stolzl',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400))
                                  ])
                            ],
                          )),
                      SizedBox(height: 50)
                    ]);
                  }),
              width: 355,
              height: 1200,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
            )),
          ],
        ));

        ;
      }
      if (state is CharacterErrorState)
        return const Center(child: Text('You have no data'));
      return Container();
    }),
  );
}
