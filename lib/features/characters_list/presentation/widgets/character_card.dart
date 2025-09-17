import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/entities/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.character,
    required this.onToggleFavorite,
    super.key,
  });

  final Character character;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Avatar(imageUrl: character.image),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: _Info(
                character: character,
                onToggleFavorite: onToggleFavorite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 110,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (_, _) => const Center(child: CircularProgressIndicator()),
        errorWidget: (_, _, _) => const Center(child: Icon(Icons.broken_image)),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({
    required this.character,
    required this.onToggleFavorite,
  });

  final Character character;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                character.name,
                style: textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: onToggleFavorite,
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                transitionBuilder: (child, anim) =>
                    ScaleTransition(scale: anim, child: child),
                child: Icon(
                  character.isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey<bool>(character.isFavorite),
                ),
              ),
              tooltip: character.isFavorite
                  ? 'Убрать из избранного'
                  : 'В избранное',
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          '${character.status} • ${character.species}',
          style: textTheme.bodyMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          'Локация: ${character.locationName}',
          style: textTheme.bodySmall?.copyWith(
            color: Theme.of(context).hintColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
