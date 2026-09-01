import 'package:bloc_project/constants/identity.dart';
import 'package:bloc_project/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.all(8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Identity.bi_white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            character.name,
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: Identity.bi_white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: Identity.bi_grey,
          child: character.imageUrl.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: "assets/images/placeholder.png",
                  image: character.imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                )
              : Image.asset("assets/images/placeholder.png"),
        ),
      ),
    );
  }
}
