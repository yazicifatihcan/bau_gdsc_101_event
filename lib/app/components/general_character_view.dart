import 'package:flutter/material.dart';

import '../models/character_detail_model.dart';

class GeneralCharacterView extends StatelessWidget {
  const GeneralCharacterView({
    super.key,
    required this.character,
  });

  final CharacterDetailModel character;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if(character.image!=null) AspectRatio(aspectRatio: 1.5,child: Image.network(character.image!,fit: BoxFit.cover,),),
        const SizedBox(height: 16),
        Text(character.name ?? 'Unknown'),
        Text(character.location?.name ?? 'Unknown'),
        Text(character.gender ?? 'Unknown'),
        Text(character.species ?? 'Unknown'),
        Text(character.status ?? 'Unknown'),
      ],
    );
  }
}