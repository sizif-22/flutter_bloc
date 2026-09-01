import 'package:bloc_project/presentation/screens/character_screen.dart';
import 'package:bloc_project/presentation/screens/characters_details.dart';
import 'package:flutter/material.dart';

import 'constants/strings.dart';

class AppRouter {
  // ignore: body_might_complete_normally_nullable
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) => CharactersScreen());
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
  }
}
