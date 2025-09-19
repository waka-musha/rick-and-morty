import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_rick_and_morty/app/di.dart';
import 'package:ta_rick_and_morty/core/theme/theme_mode_action.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/repositories/characters_repo.dart';
import 'package:ta_rick_and_morty/features/characters_list/presentation/widgets/character_card.dart';
import 'package:ta_rick_and_morty/features/favorite_characters_list/presentation/cubit/favorites_cubit.dart';
import 'package:ta_rick_and_morty/features/favorite_characters_list/presentation/cubit/favorites_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritesCubit(sl<CharactersRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Избранное'),
          actions: const [_SortButton(), ThemeModeAction()],
          flexibleSpace: const _AppBarGradient(),
        ),
        body: BlocListener<FavoritesCubit, FavoritesState>(
          listenWhen: (prev, next) =>
              prev.error != next.error &&
              next.error != null &&
              next.status != FavoritesStatus.failure,
          listener: (context, state) {
            if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error!)),
              );
            }
          },
          child: BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              switch (state.status) {
                case FavoritesStatus.initial:
                case FavoritesStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case FavoritesStatus.failure:
                  return _ErrorView(
                    message: state.error ?? 'Не удалось загрузить избранное',
                    onRetry: () => context.read<FavoritesCubit>().refresh(),
                  );
                case FavoritesStatus.empty:
                  return const _EmptyView();
                case FavoritesStatus.success:
                  return RefreshIndicator(
                    color: Theme.of(context).colorScheme.primary,
                    onRefresh: () => context.read<FavoritesCubit>().refresh(),
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      itemCount: state.items.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final character = state.items[index];
                        final cubit = context.read<FavoritesCubit>();
                        final messenger = ScaffoldMessenger.of(context);

                        return Dismissible(
                          key: ValueKey('fav_${character.id}'),
                          direction: DismissDirection.endToStart,
                          background: const _SwipeBg(),
                          onDismissed: (_) {
                            cubit.toggleFavorite(character.id);
                            messenger
                              ..clearSnackBars()
                              ..showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Убрано из избранного: ${character.name}',
                                  ),
                                  action: SnackBarAction(
                                    label: 'Отмена',
                                    onPressed: () =>
                                        cubit.toggleFavorite(character.id),
                                  ),
                                ),
                              );
                          },
                          child: KeyedSubtree(
                            key: ValueKey(character.id),
                            child: CharacterCard(
                              character: character,
                              onToggleFavorite: () =>
                                  cubit.toggleFavorite(character.id),
                            ),
                          ),
                        );
                      },
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _SortButton extends StatelessWidget {
  const _SortButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (p, n) => p.sortBy != n.sortBy || p.ascending != n.ascending,
      builder: (context, state) {
        final cubit = context.read<FavoritesCubit>();
        return PopupMenuButton<_SortAction>(
          icon: const Icon(Icons.sort),
          onSelected: (action) {
            switch (action) {
              case _SortAction.nameAsc:
                cubit.setSort(FavoritesSort.name, ascending: true);
              case _SortAction.nameDesc:
                cubit.setSort(FavoritesSort.name, ascending: false);
              case _SortAction.statusAsc:
                cubit.setSort(FavoritesSort.status, ascending: true);
              case _SortAction.statusDesc:
                cubit.setSort(FavoritesSort.status, ascending: false);
            }
          },
          itemBuilder: (_) => const [
            PopupMenuItem(
              value: _SortAction.nameAsc,
              child: Text('По имени ↑'),
            ),
            PopupMenuItem(
              value: _SortAction.nameDesc,
              child: Text('По имени ↓'),
            ),
            PopupMenuItem(
              value: _SortAction.statusAsc,
              child: Text('По статусу ↑'),
            ),
            PopupMenuItem(
              value: _SortAction.statusDesc,
              child: Text('По статусу ↓'),
            ),
          ],
        );
      },
    );
  }
}

enum _SortAction { nameAsc, nameDesc, statusAsc, statusDesc }

class _SwipeBg extends StatelessWidget {
  const _SwipeBg();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            cs.errorContainer,
          ],
        ),
      ),
      child: Icon(Icons.delete_outline, color: cs.onErrorContainer),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Пока ничего нет. Отмечайте персонажей ⭐ на главном экране.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            FilledButton(onPressed: onRetry, child: const Text('Повторить')),
          ],
        ),
      ),
    );
  }
}

class _AppBarGradient extends StatelessWidget {
  const _AppBarGradient();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            cs.primary.withValues(alpha: 0.90),
            cs.secondary.withValues(alpha: 0.90),
          ],
        ),
      ),
    );
  }
}
