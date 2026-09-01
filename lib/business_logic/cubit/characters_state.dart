part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {
  const CharactersState();
}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;

  const CharactersLoaded(this.characters);
}
