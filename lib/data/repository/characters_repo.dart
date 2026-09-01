import 'package:bloc_project/data/models/characters.dart';
import 'package:bloc_project/data/web/characters_web.dart';

class CharactersRepo {
  CharactersWebService charactersWebService;

  CharactersRepo(this.charactersWebService);

  Future<List<dynamic>> getAllCharacters() async {
    final characters = await charactersWebService.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}
