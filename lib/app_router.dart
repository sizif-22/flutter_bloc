import 'package:bloc_project/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_project/data/repository/characters_repo.dart';
import 'package:bloc_project/data/web/characters_web.dart';
import 'package:bloc_project/presentation/screens/character_screen.dart';
import 'package:bloc_project/presentation/screens/characters_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';

class AppRouter {
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersCubit = CharactersCubit(CharactersRepo(CharactersWebService()));
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());

      case charactersScreen:
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
    }
  }
}
