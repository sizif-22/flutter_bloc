import 'package:bloc_project/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_project/constants/identity.dart';
import 'package:bloc_project/data/models/characters.dart';
import 'package:bloc_project/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharactersCubit>(context)
        .getAllCharacters();
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: Identity.bi_grey,
        child: Column(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemCount: allCharacters.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, idx) {
                return CharacterItem(character: allCharacters[idx]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidget();
        } else {
          return showLoadingIndecator();
        }
      },
    );
  }

  Widget showLoadingIndecator() {
    return Center(child: CircularProgressIndicator(color: Identity.bi_yellow));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Identity.bi_yellow,
        title: Text('Characters', style: TextStyle(color: Identity.bi_grey)),
      ),
      body: buildBlocWidget(),
    );
  }
}
