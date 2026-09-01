import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/models/characters.dart';
import 'package:bloc_project/data/repository/characters_repo.dart';
import 'package:flutter/foundation.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  late List<Character> characters;
  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
