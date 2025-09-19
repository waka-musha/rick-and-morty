import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_rick_and_morty/app/di.dart';
import 'package:ta_rick_and_morty/features/characters_list/presentation/cubit/characters_cubit.dart';
import 'package:ta_rick_and_morty/features/characters_list/presentation/cubit/characters_state.dart';
import 'package:ta_rick_and_morty/features/characters_list/presentation/widgets/character_card.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late final CharactersCubit _cubit;
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _cubit = CharactersCubit(sl())..loadFirstPage();
    _controller = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    final position = _controller.position;
    final threshold = position.maxScrollExtent * 0.8;
    if (position.pixels >= threshold) {
      _cubit.loadNextPage();
    }
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onScroll)
      ..dispose();
    unawaited(_cubit.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Персонажи')),
        body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            switch (state.status) {
              case CharactersStatus.initial:
              case CharactersStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case CharactersStatus.failure:
                return _ErrorView(
                  message: state.error ?? 'Не удалось загрузить данные',
                  onRetry: () => _cubit.loadFirstPage(forceRefresh: true),
                );
              case CharactersStatus.success:
                if (state.items.isEmpty) {
                  return const _EmptyView();
                }
                return RefreshIndicator(
                  onRefresh: () => _cubit.refresh(),
                  child: ListView.builder(
                    controller: _controller,
                    itemCount:
                        state.items.length + (state.isLoadingMore ? 1 : 0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    itemBuilder: (context, index) {
                      if (index >= state.items.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      final character = state.items[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: CharacterCard(
                          character: character,
                          onToggleFavorite: () =>
                              _cubit.toggleFavorite(character.id),
                        ),
                      );
                    },
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) => const Center(child: Text('Пусто :('));
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
