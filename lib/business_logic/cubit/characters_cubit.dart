import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/models/characters.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(const CharactersState());
}
