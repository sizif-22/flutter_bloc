part of 'characters_cubit.dart';

class CharactersState {
  const CharactersState();
}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;

  CharactersLoaded(this.characters);
}