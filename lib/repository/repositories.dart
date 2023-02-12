import 'dart:convert';
import 'package:rick_morty/models/character_model.dart';
import 'package:http/http.dart' as http;

class CharactersRepository {
  Future<List<Character>> fetchCharacter() async {
    var response =
        await http.get(Uri.parse("https://rickandmortyapi.com/api/character"));

    var data = jsonDecode(response.body);

    List<Character> _CharacterList = [];

    if (response.statusCode == 200) {
      for (var item in data["results"]) {
        Character _character = Character.fromJson(item);
        _CharacterList.add(_character);
      }
      return _CharacterList;
    } else {
      return _CharacterList; // empty list
    }
  }
}
