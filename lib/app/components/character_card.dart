import 'package:flutter/material.dart';

import '../models/all_characters_response_model.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character,required this.onTap});

  final Result character;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (character.image != null)
                Image.network(
                  character.image!,
                  fit: BoxFit.cover,
                  height: 50,
                ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name ?? 'Unknown',
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(character.gender ?? 'Unknown', style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.chevron_right)
            ],
          ),
        ),
      ),
    );
  }
}