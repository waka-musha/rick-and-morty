import 'dart:async';
import 'package:flutter/foundation.dart'; // setEquals, debugPrint
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/entities/character.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/repositories/characters_repo.dart';
import 'package:ta_rick_and_morty/features/favorite_characters_list/presentation/cubit/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this._repo) : super(const FavoritesState()) {
    _subscribeFavorites();
  }

  final CharactersRepo _repo;
  StreamSubscription<Set<int>>? _idsSub;

  void _subscribeFavorites() {
    _idsSub = _repo.watchFavorites().listen((ids) {
      if (setEquals(ids, state.favoriteIds)) return;
      unawaited(_loadByIds(ids));
    });
  }

  Future<void> refresh() async {
    if (state.status == FavoritesStatus.loading) return;
    emit(state.copyWith(isRefreshing: true, error: null));
    await _loadByIds(state.favoriteIds, forceReload: true);
  }

  Future<void> toggleFavorite(int id) async {
    final idx = state.items.indexWhere((c) => c.id == id);
    if (idx != -1) {
      final updated = List<Character>.of(state.items);
      updated[idx] = updated[idx].copyWith(
        isFavorite: !updated[idx].isFavorite,
      );
      emit(
        state.copyWith(
          items: _applySort(
            updated,
            sortBy: state.sortBy,
            ascending: state.ascending,
          ),
        ),
      );
    }
    await _repo.toggleFavorite(id);
  }

  void setSort(FavoritesSort sortBy, {bool? ascending}) {
    final nextAsc = ascending ?? state.ascending;
    emit(
      state.copyWith(
        sortBy: sortBy,
        ascending: nextAsc,
        items: _applySort(
          state.items,
          sortBy: sortBy,
          ascending: nextAsc,
        ),
      ),
    );
  }

  Future<void> _loadByIds(Set<int> ids, {bool forceReload = false}) async {
    if (ids.isEmpty) {
      emit(
        state.copyWith(
          status: FavoritesStatus.empty,
          favoriteIds: ids,
          items: const [],
          isRefreshing: false,
          error: null,
        ),
      );
      return;
    }

    if (state.status == FavoritesStatus.loading && !forceReload) return;

    final goingLoading = state.status == FavoritesStatus.initial || forceReload;
    if (goingLoading) {
      emit(
        state.copyWith(
          status: FavoritesStatus.loading,
          favoriteIds: ids,
          error: null,
          isRefreshing: forceReload,
        ),
      );
    } else {
      emit(state.copyWith(favoriteIds: ids, error: null));
    }

    try {
      final characters = await _repo.getByIds(ids);
      final sorted = _applySort(
        characters,
        sortBy: state.sortBy,
        ascending: state.ascending,
      );
      emit(
        state.copyWith(
          status: sorted.isEmpty
              ? FavoritesStatus.empty
              : FavoritesStatus.success,
          items: sorted,
          favoriteIds: ids,
          isRefreshing: false,
          error: null,
        ),
      );
    } on Object catch (e) {
      debugPrint('[FAVORITES] load error: $e');
      emit(
        state.copyWith(
          status: FavoritesStatus.failure,
          error: e.toString(),
          isRefreshing: false,
        ),
      );
    }
  }

  List<Character> _applySort(
    List<Character> list, {
    required FavoritesSort sortBy,
    required bool ascending,
  }) {
    final items = List<Character>.of(list);
    final dir = ascending ? 1 : -1;

    switch (sortBy) {
      case FavoritesSort.name:
        items.sort((a, b) {
          final an = a.name.toLowerCase();
          final bn = b.name.toLowerCase();
          return an.compareTo(bn) * dir;
        });

      case FavoritesSort.status:
        int rank(String s) {
          switch (s.toLowerCase()) {
            case 'alive':
              return 0;
            case 'dead':
              return 1;
            case 'unknown':
              return 2;
            default:
              return 3;
          }
        }

        items.sort((a, b) {
          final r = rank(a.status).compareTo(rank(b.status));
          if (r != 0) return r * dir;
          return a.name.toLowerCase().compareTo(b.name.toLowerCase()) * dir;
        });
    }
    return items;
  }

  @override
  Future<void> close() async {
    await _idsSub?.cancel();
    return super.close();
  }
}
