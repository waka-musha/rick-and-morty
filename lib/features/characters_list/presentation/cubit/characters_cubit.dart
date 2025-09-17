import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/entities/character.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/repositories/characters_repo.dart';
import 'package:ta_rick_and_morty/features/characters_list/presentation/cubit/characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this._repo) : super(const CharactersState()) {
    _subscribeFavorites();
  }

  final CharactersRepo _repo;
  StreamSubscription<Set<int>>? _favSub;

  Future<void> loadFirstPage({bool forceRefresh = false}) async {
    if (state.status == CharactersStatus.loading) return;

    emit(
      state.copyWith(
        status: CharactersStatus.loading,
        error: null,
        page: 1,
        isLoadingMore: false,
        isRefreshing: false,
      ),
    );

    try {
      final page = await _repo.getPage(page: 1, forceRefresh: forceRefresh);
      emit(
        state.copyWith(
          status: CharactersStatus.success,
          items: page.results,
          page: page.page,
          totalPages: page.totalPages,
          hasNext: page.hasNext,
        ),
      );
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: CharactersStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> refresh() => loadFirstPage(forceRefresh: true);

  Future<void> loadNextPage() async {
    if (state.isLoadingMore ||
        !state.hasNext ||
        state.status != CharactersStatus.success) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true, error: null));

    final next = state.page + 1;
    try {
      final page = await _repo.getPage(page: next);
      final merged = List<Character>.of(state.items)..addAll(page.results);

      emit(
        state.copyWith(
          items: merged,
          page: page.page,
          totalPages: page.totalPages,
          hasNext: page.hasNext,
          isLoadingMore: false,
        ),
      );
    } on Object catch (e) {
      emit(state.copyWith(isLoadingMore: false, error: e.toString()));
    }
  }

  Future<void> toggleFavorite(int id) async {
    final idx = state.items.indexWhere((item) => item.id == id);
    if (idx != -1) {
      final updated = List<Character>.of(state.items);
      updated[idx] = updated[idx].copyWith(
        isFavorite: !updated[idx].isFavorite,
      );
      emit(state.copyWith(items: updated));
    }
    await _repo.toggleFavorite(id);
  }

  void _subscribeFavorites() {
    _favSub = _repo.watchFavorites().listen((favIds) {
      if (state.items.isEmpty) return;
      final updated = state.items
          .map((c) => c.copyWith(isFavorite: favIds.contains(c.id)))
          .toList();
      emit(state.copyWith(items: updated));
    });
  }

  @override
  Future<void> close() async {
    await _favSub?.cancel();
    return super.close();
  }
}
