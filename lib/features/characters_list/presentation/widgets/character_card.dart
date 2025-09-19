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
    final cs = Theme.of(context).colorScheme;
    return SizedBox(
      width: 110,
      height: 110,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (_, _) => const Center(child: CircularProgressIndicator()),
        errorWidget: (_, _, _) =>
            Center(child: Icon(Icons.broken_image, color: cs.onSurfaceVariant)),
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
    final theme = Theme.of(context);
    final tt = theme.textTheme;
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                character.name,
                style: tt.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: onToggleFavorite,
              tooltip: character.isFavorite
                  ? 'Убрать из избранного'
                  : 'В избранное',
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                transitionBuilder: (child, anim) =>
                    ScaleTransition(scale: anim, child: child),
                child: Icon(
                  character.isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey<bool>(character.isFavorite),
                  color: character.isFavorite ? cs.secondary : null,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            _StatusChip(status: character.status),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                character.species,
                style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Локация: ${character.locationName}',
          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final s = status.toLowerCase();
    late final Color bg;
    late final Color on;

    switch (s) {
      case 'alive':
        bg = cs.primaryContainer;
        on = cs.onPrimaryContainer;
      case 'dead':
        bg = cs.errorContainer;
        on = cs.onErrorContainer;
      case 'unknown':
        bg = cs.surfaceContainerHighest;
        on = cs.onSurface;
      default:
        bg = cs.surfaceContainerHighest;
        on = cs.onSurface;
    }

    String capitalized(String v) {
      final t = v.trim();
      if (t.isEmpty) return t;
      return '${t[0].toUpperCase()}${t.substring(1).toLowerCase()}';
    }

    final label = capitalized(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: on.withValues(alpha: 0.24)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: on,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
